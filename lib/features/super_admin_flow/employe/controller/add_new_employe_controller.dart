import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';

class AddNewEmployeeController extends GetxController {
  // Observable variables for form fields
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

  Future<void> addEmployee() async {
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
        "dateOfBirth": AppHelperFunctions.convertDateFormat(dateOfBirth.value),
        "gender": gender.value,
        "specialization": specializations,
        "fcmToken": "sample_fcm_token",
        "role": role.value,
        "serviceLength": serviceLength.value,
        "department": department.value,
        "joinDate": AppHelperFunctions.convertDateFormat(joiningDate.value),
        "location": workLocation.value,
        "employeeType": employmentType.value
      };

      log(bodyData.toString());

      final image = await dio.MultipartFile.fromFile(employeeImage.value,
          filename: "profile${DateTime.now().millisecondsSinceEpoch}.jpg");

      final dio.FormData formData = dio.FormData.fromMap({
        "bodyData": jsonEncode(bodyData),
        "profileImage": image,
      });

      final response = await dioClient.post(
        AppUrls.register,
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

    clearForm();
  }

  Future<void> selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && image.path.isNotEmpty) {
      employeeImage.value = image.path;
    }
  }

  void clearForm() {
    name.value = '';
    userId.value = '';
    password.value = '';
    designation.value = '';
    dateOfBirth.value = '';
    gender.value = '';
    specializations.clear();
    role.value = '';
    serviceLength.value = '';
    department.value = '';
    joiningDate.value = '';
    workLocation.value = '';
    employmentType.value = '';
  }
}
