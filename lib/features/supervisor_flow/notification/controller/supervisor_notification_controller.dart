import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/supervisor_flow/notification/model/supervisor_notification_model.dart';

class SupervisorNotificationController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<SupervisorNotificationModel?> notifications =
      Rx<SupervisorNotificationModel?>(null);
  Future<void> getAdminNotification() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.notification,
          token: AuthService.token);
      if (response.isSuccess) {
        log(response.responseData.toString());
        notifications.value =
            SupervisorNotificationModel.fromJson(response.responseData);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAdminNotification();
  }
}
