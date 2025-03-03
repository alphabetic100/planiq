import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.catagory,
      required this.title,
      required this.date,
      required this.subtitle});
  final String catagory;
  final String title;
  final String date;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFE2EAEC),
            child: catagory == "general"
                ? Icon(
                    Icons.notifications_active,
                    color: Color(0xff526366),
                  )
                : Icon(
                    Icons.error,
                    color: Color(0xff526366),
                  ),
          ),
          title: CustomText(
            text: title,
          ),
          trailing: CustomText(
            text: date,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.textSecondary,
          ),
        ),
        VerticalSpace(height: 10.h),
        CustomText(
          text: subtitle,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 10.h),
        CustomJobCard(
          title: 'Emergency Pipe Repair',
          status: 'Starting soon',
          address: '9641 Sunset Blvd',
          city: 'Beverly Hills',
          state: 'California',
          zipCode: '90210',
          dateTime: DateTime(2025, 1, 22),
          startTime: const TimeOfDay(hour: 10, minute: 0),
          endTime: const TimeOfDay(hour: 12, minute: 30),
          onViewDetails: () {},
          onStartJob: () {},
        ),
      ],
    );
  }
}
