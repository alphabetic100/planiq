import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard(
      {super.key, required this.title, required this.data});
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondary,
        ),
        HorizontalSpace(width: 5.w),
        CustomText(
          text: data,
          fontSize: 16.sp,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
