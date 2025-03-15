import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/notification/model/admin_notification_model.dart';

class AdminNotificationController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<AdminNotificationModel?> notifications = Rx<AdminNotificationModel?>(null);
  Future<void> getAdminNotification() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.notification,
          token: AuthService.token);
      if (response.isSuccess) {
        log(response.responseData.toString());
        notifications.value =
            AdminNotificationModel.fromJson(response.responseData);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAdminNotification();
  }
}
