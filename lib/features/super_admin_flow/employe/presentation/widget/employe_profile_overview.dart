import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/edit_employe_details_screen.dart';

class EmployeProfileOverview extends StatelessWidget {
  EmployeProfileOverview({super.key});
  final List<Map<String, String>> overviews = [
    {
      "title": "Total Job",
      "value": "12",
    },
    {
      "title": "Compleated",
      "value": "8",
    },
    {
      "title": "Scheduled",
      "value": "4",
    },
    {
      "title": "Declined",
      "value": "2",
    },
  ];
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
                      text: overviews[index]["title"]!,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: getKOverviewColors(index),
                    ),
                    VerticalSpace(height: 10.h),
                    CustomText(
                      text: overviews[index]["value"]!,
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
            CustomButton(onTap: () {}, title: "Assign Task"),
            VerticalSpace(height: 16.h),
            CustomButton(
                isPrimary: false,
                titleColor: AppColors.textSecondary,
                bordercolor: AppColors.borderColor,
                onTap: () {
                  Get.to(() => EditEmployeeDetailsScreen());
                },
                title: "Edit Employee Details "),
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
