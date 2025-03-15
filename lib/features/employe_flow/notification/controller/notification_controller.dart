import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/employe_flow/notification/model/employee_notification_model.dart';

class EmployeeNotificationController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<EmployeeNotificationModel?> notifications =
      Rx<EmployeeNotificationModel?>(null);
  Future<void> getEmployeeNotification() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.notification,
          token: AuthService.token);
      if (response.isSuccess) {
        log(response.responseData.toString());
        notifications.value =
            EmployeeNotificationModel.fromJson(response.responseData);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEmployeeNotification();
  }
}
