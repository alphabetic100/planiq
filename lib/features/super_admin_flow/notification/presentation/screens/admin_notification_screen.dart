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
import 'package:planiq/features/super_admin_flow/notification/controller/admin_notification_controller.dart';
import 'package:planiq/features/super_admin_flow/notification/presentation/widget/admin_notification_card.dart';

class AdminNotificationScreen extends StatelessWidget {
  AdminNotificationScreen({super.key});

  final List<String> statusCategories = ["All", "Accepted", "Rejected"];
  final List<String> dateCategories = [
    "Today",
    "Yesterday",
    "This Week",
    "This Month",
    "This Year",
    "Custom Date",
  ];

  final AdminNotificationController notificationController =
      Get.put(AdminNotificationController());

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
                  _buildDropdown(
                    context,
                    notificationController.statusFilter.value,
                    statusCategories,
                    (value) =>
                        notificationController.updateStatusFilter(value!),
                  ),
                  _buildDateDropdown(context),
                ],
              ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                  onRefresh: notificationController.getAdminNotification,
                  child: ListView.builder(
                    itemCount: notifications.data.notifications.length,
                    itemBuilder: (context, index) {
                      final notification =
                          notifications.data.notifications[index];
                      return AdminNotificationCard(
                        title: notification.title,
                        subtitle: notification.body,
                        isAccepted: notification.title
                                .toLowerCase()
                                .contains("congratulations") ||
                            notification.title
                                .toLowerCase()
                                .contains("accepted"),
                        date: DateTime.now(),
                        onTap: () => log('Notification tapped'),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  Widget _buildDropdown(BuildContext context, String selectedValue,
      List<String> items, ValueChanged<String?> onChanged) {
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
          value: selectedValue,
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
          onChanged: onChanged,
        ),
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
          value:
              dateCategories.contains(notificationController.dateFilter.value)
                  ? notificationController.dateFilter.value
                  : "Custom Date",
          items: dateCategories.map((item) {
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
            if (value == "Custom Date") {
              _showCustomDatePicker(context);
            } else {
              notificationController.updateDateFilter(value!);
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
              notificationController.dateFilter.value =
                  AppHelperFunctions.convertDateFormat(
                          AppHelperFunctions.getFormattedDate(selectedDate)) ??
                      "";
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
