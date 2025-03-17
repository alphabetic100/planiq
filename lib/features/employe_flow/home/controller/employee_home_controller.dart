import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/values/profile_values.dart';
import 'package:planiq/features/employe_flow/home/model/employee_home_model.dart';

class EmployeeHomeController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<EmployeeHomeModel?> home = Rx(null);

  Future<void> getHomeData() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.employeeHome,
          token: AuthService.token);
      if (response.isSuccess) {
        home.value = EmployeeHomeModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Seomthing went wrong, error; $e");
    }
  }

  Future<void> startJob(String jobId) async {
    final requestUrl = "${AppUrls.tasks}/progress/$jobId";
    log(requestUrl);
    try {
      showProgressIndicator();
      final response = await networkCaller.patchRequest(requestUrl,
          token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(successMessage: "Job started successfully");
        getHomeData();
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Seomthing went wrong, error; $e");
    }
  }

  Future<void> getMyProfile() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.myProfile,
          token: AuthService.token);

      if (response.isSuccess) {
        final profile = response.responseData;
        final name = profile["data"]["name"];
        log("here $name");
        final profileImage = profile["data"]["profileImage"];
        log("here $profileImage");
        final personID = profile["data"]["personId"];
        log("here $personID");
        ProfileValues.name.value = name;
        ProfileValues.profileImage.value = profileImage;
        ProfileValues.personID.value = personID;

        log("______________________________________________$profileImage.toString()");
        log("______________________________________________$personID.toString()");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
    getMyProfile();
  }
}
