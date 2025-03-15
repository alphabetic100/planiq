import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/notification/controller/notification_controller.dart';
import 'package:planiq/features/employe_flow/notification/presentation/components/notification_card.dart';

class EmployeNotificationScreen extends StatelessWidget {
  EmployeNotificationScreen({super.key});
  final EmployeeNotificationController notificationController =
      Get.put(EmployeeNotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appbarHeight: 70.h,
          title: "Notification",
        ),
        body: SingleChildScrollView(
          child: BodyPadding(
            child: Obx(() {
              final notifications = notificationController.notifications.value;
              if (notifications == null) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              } else if (notifications.data.data.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Center(
                    child: CustomText(text: "No notifications are available"),
                  ),
                );
              } else {
                return Column(
                  children: [
                    VerticalSpace(height: 20.h),
                    ListView.builder(
                        itemCount: notifications.data.data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final notification = notifications.data.data[index];
                          log(notification.job.status);
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.0.h),
                            child: NotificationCard(
                              catagory: 'general',
                              title: notification.title,
                              subtitle: notification.body,
                              date: notification.createdAt.toString(),
                              job: notification.job,
                              jobId: notification.jobId,
                            ),
                          );
                        }),
                  ],
                );
              }
            }),
          ),
        ));
  }
}
