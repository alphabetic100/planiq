import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/overview/model/all_task_status_model.dart';

class AdminOverviewController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<TaskCountResponse?> taskStatus = Rx<TaskCountResponse?>(null);

  Future<void> getAllTaskStatus() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.allTaskStatus,
          token: AuthService.token);
      if (response.isSuccess) {
        taskStatus.value = TaskCountResponse.fromJson(response.responseData);
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
    getAllTaskStatus();
  }
}
