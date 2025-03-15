import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/overview/controller/admin_overview_controller.dart';

class AdminOverviewBody extends StatelessWidget {
  AdminOverviewBody({super.key});
  final List overviews = [
    "Total Task",
    "Assigned Task",
    "Unassigned Task",
    "Completed Task",
  ];
  final AdminOverviewController overviewController =
      Get.put(AdminOverviewController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RefreshIndicator(
          color: AppColors.primaryColor,
          backgroundColor: AppColors.secondaryColor,
          onRefresh: () => overviewController.getAllTaskStatus(),
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
                    color: index == 0
                        ? Color(0xFFF2FDFF)
                        : index == 1
                            ? Color(0xFFF1FFF5)
                            : index == 2
                                ? Color(0xFFFFF2F2)
                                : Color(0xFFF2F6FF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: overviews[index],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: getOverviewColors(index),
                      ),
                      VerticalSpace(height: 10.h),
                      Obx(
                        () => CustomText(
                          text: overviewController.taskStatus.value != null
                              ? index == 0
                                  ? overviewController
                                      .taskStatus.value!.data.total
                                      .toString()
                                  : index == 1
                                      ? overviewController
                                          .taskStatus.value!.data.assigned
                                          .toString()
                                      : index == 3
                                          ? overviewController
                                              .taskStatus.value!.data.unassigned
                                              .toString()
                                          : overviewController
                                              .taskStatus.value!.data.completed
                                              .toString()
                              : "0",
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: getOverviewColors(index),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Color getOverviewColors(int index) {
  if (index == 0) {
    return Color(0xFF00768A);
  } else if (index == 1) {
    return Color(0xFF16A34A);
  } else if (index == 2) {
    return Color(0xFF8A0000);
  } else {
    return Color(0xFF00298A);
  }
}
