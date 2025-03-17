import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/values/profile_values.dart';
import 'package:planiq/features/supervisor_flow/overview/model/supervisor_overview_model.dart';

class SupervisorOverviewController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<SupervisorOverviewModel?> taskStatus = Rx(null);
  Future<void> getTaskStatusSupervisor() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.superTaskStatus,
          token: AuthService.token);
      if (response.isSuccess) {
        taskStatus.value =
            SupervisorOverviewModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
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
    getTaskStatusSupervisor();
    getMyProfile();
  }
}
