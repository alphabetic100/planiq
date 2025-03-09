import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';

class TaskDetailFields extends StatelessWidget {
  const TaskDetailFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Job Title",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(),
        VerticalSpace(height: 16),
        CustomText(
          text: "Job Location",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          prefixIcon: Image.asset(IconPath.locationIcon),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Job Date",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          readOnly: true,
          prefixIcon: Image.asset(IconPath.calendarIcon),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Job Time",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          readOnly: true,
          prefixIcon: Image.asset(IconPath.timerIcon),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Location Map Link",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          readOnly: true,
          prefixIcon: Image.asset(IconPath.locationIcon),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Description",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          maxLines: 4,
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Payment Rate (Starting)",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          prefixIcon: Icon(
            Icons.euro,
            color: AppColors.primaryColor,
          ),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Estimated Duration",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(),
        VerticalSpace(height: 16),
        CustomText(
          text: "Admin Notes",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          maxLines: 4,
        ),
      ],
    );
  }
}
