import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
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

  Future<void> saveChanges() async {}

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
