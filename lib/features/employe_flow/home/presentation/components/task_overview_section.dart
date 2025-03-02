import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class TaskOverviewSection extends StatelessWidget {
  const TaskOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Task Overview",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: Color(0xFF0F2326),
        ),
        VerticalSpace(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFF1FFF5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "3",
                      color: AppColors.green,
                    ),
                    CustomText(
                      text: "Compleated",
                      color: AppColors.green,
                    ),
                  ],
                ),
              ),
            ),
            HorizontalSpace(width: 16.w),
            Expanded(
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFF2FDFF)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "5",
                      color: Color(0xFF00768A),
                    ),
                    CustomText(
                      text: "Compleated",
                      color: Color(0xFF00768A),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
