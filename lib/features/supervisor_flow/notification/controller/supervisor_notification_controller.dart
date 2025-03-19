import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/supervisor_flow/notification/model/supervisor_notification_model.dart';

class SupervisorNotificationController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();

  RxString statusFilter = "All".obs;
  RxString dateFilter = "Today".obs;
  RxString customDate = "".obs;

  Rx<SupervisorNotificationModel?> notifications =
      Rx<SupervisorNotificationModel?>(null);

  void updateStatusFilter(String value) {
    statusFilter.value = value;
  }

  void updateDateFilter(String value) {
    dateFilter.value = value;
  }

  Future<void> getFilteredNotifications({
    required String statusFilter,
    required String dateFilter,
  }) async {
    try {
      String requestUrlWithParams =
          statusFilter.toLowerCase() == "my notification"
              ? AppUrls.notification
              : AppUrls.superviserNotification;
      bool isFirstParam = true;

      if (statusFilter.isNotEmpty && statusFilter != "All") {
        requestUrlWithParams += "?search=$statusFilter";
        isFirstParam = false;
      }

      if (dateFilter.isNotEmpty) {
        requestUrlWithParams += isFirstParam
            ? "?dateFilter=$dateFilter"
            : "&dateFilter=$dateFilter";
      }

      final response = await networkCaller.getRequest(requestUrlWithParams,
          token: AuthService.token);

      if (response.isSuccess) {
        notifications.value =
            SupervisorNotificationModel.fromJson(response.responseData);
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> customFilter(String date) async {
    try {
      final requestUrl =
          "${AppUrls.superviserNotification}?dateFilter=custom&date=$date";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
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
    getFilteredNotifications(statusFilter: "All", dateFilter: "Today");
  }
}
