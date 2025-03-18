import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/jobs/helper/job_status_helper.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<dynamic> jobs;
  final bool isFromAdmin;

  const SearchResultsWidget({
    super.key,
    required this.jobs,
    this.isFromAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    return jobs.isEmpty
        ? Center(
            child: CustomText(
              text: "No Jobs Found",
              color: AppColors.textSecondary,
              fontSize: 16.sp,
            ),
          )
        : ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.0.h),
                child: CustomJobCard(
                  id: job.id,
                  isFromAdmin: isFromAdmin,
                  title: job.title,
                  status: decodeStatus(job.status),
                  address: job.location,
                  dateTime: DateTime.parse(job.date),
                  time: job.time,
                  onViewDetails: () {},
                  onStartJob: () {},
                ),
              );
            },
          );
  }
}
