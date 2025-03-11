import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';

class ReportViewCard extends StatelessWidget {
  const ReportViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25.w,
            backgroundColor: AppColors.secondaryColor,
            backgroundImage: AssetImage(IconPath.profileIcon),
          ),
          title: CustomText(text: "David Andrew"),
          subtitle: CustomText(
            text: "User ID: 12548",
            color: AppColors.textSecondary,
            fontSize: 14.w,
            fontWeight: FontWeight.normal,
          ),
          trailing: IconButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.primaryColor)),
              onPressed: () {},
              icon: Image.asset(
                IconPath.phoneIcon,
                color: AppColors.white,
              )),
        ),
        VerticalSpace(height: 16.h),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "I am facing an issue with Task ID #"),
              TextSpan(text: " [task number]. "),
              TextSpan(text: "The problem is: "),
              TextSpan(text: "[brief description of the issue].")
            ],
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        VerticalSpace(height: 16.h),
        CustomJobCard(
          title: 'Emergency Pipe Repair',
          status: 'Scheduled',
          address: '9641 Sunset Blvd',
          city: 'Beverly Hills',
          state: 'California',
          zipCode: '90210',
          dateTime: DateTime(2025, 1, 22),
          startTime: const TimeOfDay(hour: 10, minute: 0),
          endTime: const TimeOfDay(hour: 12, minute: 30),
          onViewDetails: () {},
          onStartJob: () {},
        )
      ],
    );
  }
}
