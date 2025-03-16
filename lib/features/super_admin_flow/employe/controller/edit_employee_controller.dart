import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/super_admin_flow/employe/model/employe_details_model.dart';

class EditEmployeeController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<EmployeDetailsModel?> profile = Rx<EmployeDetailsModel?>(null);
  RxString employeeImage = "".obs;
  final name = "".obs;
  final userId = "".obs;
  final password = "".obs;
  final designation = "".obs;
  final dateOfBirth = "".obs;
  final gender = "".obs;

  final specializations = <String>[].obs;

  final role = "".obs;
  final serviceLength = "".obs;
  final department = "".obs;

  final joiningDate = "".obs;
  final workLocation = "".obs;
  final employmentType = "".obs;
  void addSpecialization(String specialization) {
    if (specialization.isNotEmpty &&
        !specializations.contains(specialization)) {
      specializations.add(specialization);
    }
  }

  void removeSpecialization(int index) {
    if (index >= 0 && index < specializations.length) {
      specializations.removeAt(index);
    }
  }

  Future<void> selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && image.path.isNotEmpty) {
      employeeImage.value = image.path;
    }
  }

  Future<void> saveChanges(String profileID) async {
    Dio dioClient = Dio(BaseOptions(
        connectTimeout: Duration(seconds: 12),
        validateStatus: (status) {
          return status! < 500;
        }));
    if (name.value.isEmpty || userId.value.isEmpty || password.value.isEmpty) {
      errorSnakbar(
        errorMessage: 'Please fill in all required fields',
      );
      return;
    }
    if (employeeImage.value.isEmpty) {
      errorSnakbar(
        errorMessage: 'Please select a employe image',
      );
      return;
    }

    try {
      showProgressIndicator();

      final bodyData = {
        "name": name.value,
        "personId": userId.value,
        "password": password.value,
        "designation": designation.value,
        "dateOfBirth": AppHelperFunctions.backendFomater(dateOfBirth.value),
        "gender": gender.value,
        "specialization": specializations,
        "fcmToken": "sample_fcm_token",
        "role": role.value,
        "serviceLength": serviceLength.value,
        "department": department.value,
        "joinDate": AppHelperFunctions.backendFomater(joiningDate.value),
        "location": workLocation.value,
        "employeeType": employmentType.value
      };

      log(bodyData.toString());

      final image = employeeImage.value.contains("http")
          ? null
          : await dio.MultipartFile.fromFile(employeeImage.value,
              filename: "profile${DateTime.now().millisecondsSinceEpoch}.jpg");

      final dio.FormData formData = dio.FormData.fromMap({
        "bodyData": jsonEncode(bodyData),
        "profileImage": image,
      });
      final requestURL = "${AppUrls.editProfile}$profileID";
      final response = await dioClient.put(
        requestURL,
        data: formData,
        options: Options(
          headers: {
            "Authorization": AuthService.token,
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      hideProgressIndicatro();
      log(response.statusCode.toString());
      log(response.data.toString());

      if (response.statusCode == 201 || response.statusCode == 200) {
        successSnakbr(successMessage: "Employee added successfully");
        Get.back();
      } else {
        errorSnakbar(errorMessage: response.data["message"]);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> fetchEmployeeDetails(String profileID) async {
    if (profileID.isEmpty) {
      return;
    }
    try {
      final requestUrl = "${AppUrls.register}/$profileID";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      if (response.statusCode == 200) {
        log(response.responseData.toString());
        profile.value = EmployeDetailsModel.fromJson(response.responseData);
        final data = profile.value!.data;

        name.value = data.name;
        userId.value = data.personId;
        password.value = data.password;
        designation.value = data.designation;
        dateOfBirth.value = data.dateOfBirth.toString();
        gender.value = data.gender;
        role.value = data.job[0].role;
        serviceLength.value = data.job[0].serviceLength;
        department.value = data.job[0].department;
        joiningDate.value = data.administrative[0].joinDate.toString();
        workLocation.value = data.administrative[0].location;
        employmentType.value = data.administrative[0].location;

        if (data.specialization.isNotEmpty) {
          specializations.value = List<String>.from(data.specialization);
        }

        employeeImage.value = data.profileImage;
      } else {
        Get.snackbar('Error', 'Failed to fetch employee details');
      }
    } catch (e) {
      // Handle any other errors (e.g., network issues)
      Get.snackbar('Error', 'An error occurred while fetching details: $e');
    }
  }
}
