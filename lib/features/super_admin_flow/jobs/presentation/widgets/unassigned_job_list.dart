import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/unassigned_job_controller.dart';
import 'package:planiq/features/super_admin_flow/jobs/helper/job_status_helper.dart';

class UnassignedJobList extends StatelessWidget {
  UnassignedJobList({super.key, this.isFromAdmin = false});
  final UnAssignedJobsController jobsController =
      Get.put(UnAssignedJobsController());
  final bool isFromAdmin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Obx(() {
          if (jobsController.jobs.value == null) {
            return SizedBox.shrink();
          } else if (jobsController.jobs.value!.data.jobs.isEmpty) {
            return RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              onRefresh: () => jobsController.getJobList(AppUrls.unAssigned),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: CustomText(text: "No Jobs Found"),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => jobsController.getJobList(AppUrls.unAssigned),
              color: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: jobsController.jobs.value!.data.jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobsController.jobs.value!.data.jobs[index];
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
                  }),
            );
          }
        }))
      ],
    );
  }
}
