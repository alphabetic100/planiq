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
import 'package:planiq/features/super_admin_flow/notification/presentation/widget/admin_notification_card.dart';

class AdminNotificationScreen extends StatelessWidget {
  AdminNotificationScreen({super.key});
  final List statusCatagories = [
    "All",
    "Accepted",
    "Rejected",
  ];
  final List dateCatagories = [
    "Today",
    "Yesterday",
    "This Week",
    "This Month",
    "This Year",
    "Custom Date",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appbarHeight: 70.h,
          title: "Notification",
        ),
        body: Column(
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
                      items: List.generate(statusCatagories.length, (index) {
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
                                      decorationColor: AppColors.primaryColor,
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AdminNotificationCard(
                      taskId: '123546',
                      userId: '12535',
                      isAccepted: index % 2 == 0,
                      date: DateTime.now(),
                      onTap: () {
                        log('Another notification tapped');
                      },
                    );
                  }),
            )
          ],
        ));
  }
}
