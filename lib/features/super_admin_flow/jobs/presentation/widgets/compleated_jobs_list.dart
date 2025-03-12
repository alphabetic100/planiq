import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/compleated_jobs_controller.dart';
import 'package:planiq/features/super_admin_flow/jobs/helper/job_status_helper.dart';

class CompleatedJobsList extends StatelessWidget {
  CompleatedJobsList({super.key});
  final CompleatedJobsController jobsController =
      Get.put(CompleatedJobsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(height: 20),
        Expanded(child: Obx(() {
          if (jobsController.jobs.value == null) {
            return SizedBox.shrink();
          } else if (jobsController.jobs.value!.data.jobs.isEmpty) {
            return Center(
              child: CustomText(text: "No Jobs Found"),
            );
          } else {
            return RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              onRefresh: () => jobsController.getJobList(AppUrls.compleated),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: jobsController.jobs.value!.data.jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobsController.jobs.value!.data.jobs[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.0.h),
                      child: CustomJobCard(
                        isFromAdmin: true,
                        title: job.title,
                        status: decodeStatus(job.status),
                        address: job.location,
                        city: '',
                        state: '',
                        zipCode: '',
                        dateTime: DateTime.parse(job.date),
                        time: job.time,
                        onViewDetails: () {},
                        onStartJob: () {},
                      ),
                    );
                  }),
            );
          }
        }))
      ],
    );
  }
}
