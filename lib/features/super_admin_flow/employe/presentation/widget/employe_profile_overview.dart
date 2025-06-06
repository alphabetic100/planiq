import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/assign_task/controller/assign_task_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/edit_employe_details_screen.dart';

class EmployeProfileOverview extends StatelessWidget {
  EmployeProfileOverview({
    super.key,
    required this.totalJob,
    required this.compleated,
    required this.scheduled,
    required this.declined,
    this.isFromBooking = false,
    this.taskID = "",
    this.employeID = "",
  });
  final List overviews = [
    "Total Job",
    "Compleated",
    "Scheduled",
    "Declined",
  ];
  final String totalJob;
  final String compleated;
  final String scheduled;
  final String declined;
  final String taskID;
  final bool isFromBooking;
  final String employeID;
  final AssignTaskController controller = Get.put(AssignTaskController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: getKOverviewColors(index).withOpacity(0.10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: overviews[index],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: getKOverviewColors(index),
                    ),
                    VerticalSpace(height: 10.h),
                    CustomText(
                      text: index == 0
                          ? totalJob
                          : index == 1
                              ? compleated
                              : index == 2
                                  ? scheduled
                                  : declined,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: getKOverviewColors(index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        VerticalSpace(height: 40.h),
        Column(
          children: [
            if (isFromBooking) ...[
              CustomButton(
                  onTap: () {
                    log(taskID);
                    log(employeID);
                    if (taskID.isEmpty && employeID.isEmpty) {
                      errorSnakbar(
                          errorMessage:
                              "Something went wrong, please try again");
                      return;
                    } else {
                      controller.assignTask(userId: employeID, jobId: taskID);
                    }
                  },
                  title: "Assign Task"),
              VerticalSpace(height: 16.h),
            ],
            CustomButton(
                isPrimary: false,
                titleColor: AppColors.textSecondary,
                bordercolor: AppColors.borderColor,
                onTap: () {
                  Get.to(() => EditEmployeeDetailsScreen(
                        employeeID: employeID,
                      ));
                },
                title: "Edit Employee Details"),
          ],
        ),
        VerticalSpace(height: 30.h),
      ],
    );
  }
}

Color getKOverviewColors(int index) {
  if (index == 0) {
    return Color(0xFF00768A);
  } else if (index == 1) {
    return Color(0xFF00298A);
  } else if (index == 2) {
    return Color(0xFF16A34A);
  } else {
    return Color(0xFF8A0000);
  }
}
