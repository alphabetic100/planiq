import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/screens/job_details_screen.dart';
import 'package:planiq/features/employe_flow/notification/model/employee_notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.catagory,
    required this.title,
    required this.date,
    required this.subtitle,
    required this.job,
    this.jobId = "",
  });
  final String catagory;
  final String title;
  final String date;
  final String subtitle;
  final Job job;
  final String jobId;
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
            text: AppHelperFunctions.convertDateFormat(
                    AppHelperFunctions.backendFomater(date)) ??
                "",
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
          id: jobId,
          title: job.title,
          status: job.status,
          address: job.location,
          dateTime: job.date,
          time: job.time,
          onViewDetails: () {
            Get.to(() => JobDetailsScreen(
                  isFromAdmin: false,
                  jobId: jobId,
                ));
          },
          onStartJob: () {},
        ),
      ],
    );
  }
}

decodeEmployeStatus(String status) {
  switch (status) {
    case "ASSIGNED":
      return "New Assignment";
    case "ACCEPTED":
      return "Scheduled";
    case "WIP":
      return "Work In Progress";
    default:
      return status;
  }
}
