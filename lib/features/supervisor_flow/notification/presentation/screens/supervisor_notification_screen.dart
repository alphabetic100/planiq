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
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/supervisor_flow/notification/controller/supervisor_notification_controller.dart';
import 'package:planiq/features/supervisor_flow/notification/presentation/widget/supervisor_notification_card.dart';

class SupervisorNotificationScreen extends StatelessWidget {
  SupervisorNotificationScreen({super.key});

  final List<String> statusCategories = [
    "All",
    "My Notification",
    "Scheduled",
    "WIP",
    "Completed"
  ];

  final Map<String, String> dateCategoryMap = {
    "Today": "today",
    "Yesterday": "yesterday",
    "This Week": "thisWeek",
    "This Month": "thisMonth",
    "This Year": "thisYear",
    "Custom Date": "custom",
  };

  final SupervisorNotificationController notificationController =
      Get.put(SupervisorNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Notification",
      ),
      body: Column(
        children: [
          // Filter bar - always visible
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
              Obx(() => _buildDropdown(
                    context,
                    notificationController.statusFilter.value,
                    statusCategories,
                    (value) {
                      if (value != null) {
                        log(value);
                        notificationController.updateStatusFilter(value);
                        notificationController.getFilteredNotifications(
                          statusFilter:
                              value.toLowerCase() == "all" ? "" : value,
                          dateFilter: notificationController.dateFilter.value,
                        );
                      }
                    },
                  )),
              Obx(() => _buildDateDropdown(context)),
            ],
          ),
          VerticalSpace(height: 10.h),

          // Content area - changes based on state
          Expanded(
            child: Obx(() {
              final notifications = notificationController.notifications.value;

              // Show loading state
              if (notifications == null) {
                return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                );
              }

              // Show empty state if no notifications
              if (notifications.data.notifications.isEmpty) {
                return Center(
                  child: CustomText(
                    text: "No notifications available",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                );
              }

              // Show notifications list
              return RefreshIndicator(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.secondaryColor,
                onRefresh: () =>
                    notificationController.getFilteredNotifications(
                  dateFilter: notificationController.dateFilter.value,
                  statusFilter: notificationController.statusFilter.value,
                ),
                child: ListView.builder(
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
                          log('Notification tapped');
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, String selectedValue,
      List<String> items, ValueChanged<String?> onChanged) {
    final valueToDisplay =
        selectedValue.isNotEmpty ? selectedValue : items.first;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(color: Color(0xFFECF0F1)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            dropdownColor: AppColors.white,
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.chevron_down,
                  size: 15.h, color: Color(0xFF526366)),
            ),
            value: valueToDisplay,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: CustomText(
                  text: item,
                  color: item == "Custom Date"
                      ? AppColors.primaryColor
                      : Color(0xFF526366),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  decoration:
                      item == "Custom Date" ? TextDecoration.underline : null,
                  decorationColor: AppColors.primaryColor,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                notificationController.updateStatusFilter(value);
                notificationController.getFilteredNotifications(
                  statusFilter: value.toLowerCase() == "all"
                      ? ""
                      : value.toLowerCase() == "scheduled"
                          ? "ACCEPTED"
                          : value.toLowerCase() == "wip"
                              ? "WIP"
                              : value.toLowerCase() == "completed"
                                  ? "COMPLETED"
                                  : value.toUpperCase(),
                  dateFilter: notificationController.dateFilter.value,
                );
              }
            }),
      ),
    );
  }

  Widget _buildDateDropdown(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(color: Color(0xFFECF0F1)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.white,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.chevron_down,
                size: 15.h, color: Color(0xFF526366)),
          ),
          value: dateCategoryMap
                  .containsKey(notificationController.dateFilter.value)
              ? notificationController.dateFilter.value
              : "Custom Date",
          items: dateCategoryMap.keys.map((item) {
            return DropdownMenuItem(
              value: item,
              child: item == "Custom Date"
                  ? GestureDetector(
                      onTap: () => _showCustomDatePicker(context),
                      child: CustomText(
                        text: "Custom Date",
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    )
                  : CustomText(
                      text: item,
                      color: Color(0xFF526366),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              notificationController.updateDateFilter(value);
              notificationController.getFilteredNotifications(
                statusFilter: notificationController.statusFilter.value
                            .toLowerCase() ==
                        "all"
                    ? ""
                    : notificationController.statusFilter.value.toLowerCase() ==
                            "scheduled"
                        ? "ACCEPTED"
                        : notificationController.statusFilter.value
                                    .toLowerCase() ==
                                "wip"
                            ? "WIP"
                            : notificationController.statusFilter.value
                                        .toLowerCase() ==
                                    "completed"
                                ? "COMPLETED"
                                : notificationController.statusFilter.value
                                    .toUpperCase(),
                dateFilter: dateCategoryMap[value] ?? "",
              );
            }
          },
        ),
      ),
    );
  }

  void _showCustomDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: CustomCalendarWidget(
            onDaySelected: (selectedDate) {
              final formattedDate =
                  AppHelperFunctions.getFormattedDate(selectedDate);
              final convertedDate =
                  AppHelperFunctions.convertDateFormat(formattedDate);
              notificationController.dateFilter.value = convertedDate ?? "";
              notificationController
                  .customFilter(notificationController.dateFilter.value);
              Get.back();
            },
          ),
        );
      },
    );
  }
}
