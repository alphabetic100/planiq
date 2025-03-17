import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/notification/model/admin_notification_model.dart';

class AdminNotificationController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  RxString statusFilter = "All".obs;
  RxString dateFilter = "Today".obs;
  RxString customDate = "".obs;
  void updateStatusFilter(String value) {
    statusFilter.value = value;
  }

  void updateDateFilter(String value) {
    dateFilter.value = value;
  }

  Rx<AdminNotificationModel?> notifications = Rx<AdminNotificationModel?>(null);
  Future<void> getAdminNotification() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.adminNotification,
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

  Future<void> filterNotification(String filter) async {
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

  Future<void> customFilter(String date) async {
    try {
      final requestUrl =
          "${AppUrls.adminNotification}?dateFilter=custom&date=$date";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
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
