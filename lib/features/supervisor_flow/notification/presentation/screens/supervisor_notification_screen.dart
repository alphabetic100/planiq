import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_calendar_widget.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/supervisor_flow/notification/controller/supervisor_notification_controller.dart';
import 'package:planiq/features/supervisor_flow/notification/presentation/widget/supervisor_notification_card.dart';

class SupervisorNotificationScreen extends StatelessWidget {
  SupervisorNotificationScreen({super.key});
  final List statusCatagories = [
    "All",
    "My Notification",
    "Scheduled",
    "WIP",
    "Completed"
  ];
  final List dateCatagories = [
    "Today",
    "Yesterday",
    "This Week",
    "This Month",
    "This Year",
    "Custom Date",
  ];
  final SupervisorNotificationController notificationController =
      Get.put(SupervisorNotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appbarHeight: 70.h,
          title: "Notification",
        ),
        body: Obx(() {
          final notifications = notificationController.notifications.value;
          if (notifications == null) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (notifications.data.notifications.isEmpty) {
            return RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              onRefresh: notificationController.getAdminNotification,
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.9)
                ],
              ),
            );
          } else {
            return Column(
              children: [
                VerticalSpace(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: "Filter",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(color: Color(0xFFECF0F1)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: AppColors.white,
                          icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.chevron_down,
                                size: 15.h,
                                color: Color(0xFF526366),
                              )),
                          value: "option0",
                          items:
                              List.generate(statusCatagories.length, (index) {
                            return DropdownMenuItem(
                                value: "option$index",
                                child: CustomText(
                                  text: statusCatagories[index],
                                  color: Color(0xFF526366),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ));
                          }),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(color: Color(0xFFECF0F1)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: AppColors.white,
                          icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.chevron_down,
                                size: 15.h,
                                color: Color(0xFF526366),
                              )),
                          value: "option0",
                          items: List.generate(dateCatagories.length, (index) {
                            return DropdownMenuItem(
                                value: "option$index",
                                child: dateCatagories[index] == "Custom Date"
                                    ? GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  child: CustomCalendarWidget(
                                                    onDaySelected: (p0) {
                                                      log(p0.toString());
                                                      Get.back();
                                                    },
                                                  ),
                                                );
                                              });
                                        },
                                        child: CustomText(
                                          text: "Custom Date",
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColors.primaryColor,
                                        ),
                                      )
                                    : CustomText(
                                        text: dateCatagories[index],
                                        color: Color(0xFF526366),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ));
                          }),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: notifications.data.notifications.length,
                      itemBuilder: (context, index) {
                        final notification =
                            notifications.data.notifications[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: SupervisorNotificationCard(
                            title: notification.title,
                            taskId: notification.jobId,
                            body: notification.body,
                            isAccepted: notification.job.status
                                .toLowerCase()
                                .contains("new"),
                            job: notification.job,
                            date: DateTime.now(),
                            onTap: () {
                              log('Another notification tapped');
                            },
                          ),
                        );
                      }),
                )
              ],
            );
          }
        }));
  }
}
