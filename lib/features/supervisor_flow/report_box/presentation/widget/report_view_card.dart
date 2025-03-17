import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/supervisor_flow/report_box/model/report_box_model.dart';

class ReportViewCard extends StatelessWidget {
  const ReportViewCard({super.key, required this.report});
  final ReportData report;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25.w,
            backgroundColor: AppColors.secondaryColor,
            backgroundImage: report.user.profileImage.isNotEmpty
                ? NetworkImage(report.user.profileImage)
                : AssetImage(IconPath.profileIcon),
          ),
          title: CustomText(text: report.user.name),
          subtitle: CustomText(
            text: "User ID: ${report.user.personId}",
            color: AppColors.textSecondary,
            fontSize: 14.w,
            fontWeight: FontWeight.normal,
          ),
        ),
        VerticalSpace(height: 16.h),
        CustomText(
          text: report.issue,
          fontSize: 16.sp,
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w300,
        ),
        VerticalSpace(height: 16.h),
        CustomJobCard(
          id: report.jobId,
          title: report.job.title,
          status: report.job.status,
          address: report.job.location,
          dateTime: DateTime.parse(report.job.date),
          time: report.job.time,
          onViewDetails: () {},
          onStartJob: () {},
        )
      ],
    );
  }
}
