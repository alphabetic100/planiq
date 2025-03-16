import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/supervisor_flow/overview/model/supervisor_overview_model.dart';

class SupervisorOverviewController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<SupervisorOverviewModel?> taskStatus = Rx(null);
  Future<void> getTaskStatusSupervisor() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.superTaskStatus);
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaskStatusSupervisor();
  }
}
