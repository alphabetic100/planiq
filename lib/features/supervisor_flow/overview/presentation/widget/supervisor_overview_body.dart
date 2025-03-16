import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/supervisor_flow/overview/controller/supervisor_overview_controller.dart';

class SupervisorOverviewBody extends StatelessWidget {
  SupervisorOverviewBody({super.key});
  final List overviews = [
    "Total Assigned Task   ",
    "Schedule Task",
    "Work In Progress\n(WIP)",
    "Completed Task",
  ];
  final SupervisorOverviewController overviewController =
      Get.put(SupervisorOverviewController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RefreshIndicator(
          color: AppColors.primaryColor,
          backgroundColor: AppColors.secondaryColor,
          onRefresh: () => overviewController.getTaskStatusSupervisor(),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: getSOverviewColors(index).withOpacity(0.1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: overviews[index],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: getSOverviewColors(index),
                        textAlign: TextAlign.center,
                      ),
                      VerticalSpace(height: 10.h),
                      CustomText(
                        text: overviewController.taskStatus.value != null
                            ? index == 0
                                ? overviewController
                                    .taskStatus.value!.data.total
                                    .toString()
                                : index == 1
                                    ? overviewController
                                        .taskStatus.value!.data.accepted
                                        .toString()
                                    : index == 2
                                        ? overviewController
                                            .taskStatus.value!.data.wip
                                            .toString()
                                        : overviewController
                                            .taskStatus.value!.data.completed
                                            .toString()
                            : "0",
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: getSOverviewColors(index),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

Color getSOverviewColors(int index) {
  if (index == 0) {
    return Color(0xFF00768A);
  } else if (index == 1) {
    return Color(0xFF6E008A);
  } else if (index == 2) {
    return Color(0xFF16A34A);
  } else {
    return Color(0xFF00278A);
  }
}
