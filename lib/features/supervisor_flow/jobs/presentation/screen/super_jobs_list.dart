import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/supervisor_flow/jobs/controller/get_my_tasks_controller.dart';

class SuperJobList extends StatelessWidget {
  SuperJobList({
    super.key,
    this.isSupervisor = false,
  });
  final bool isSupervisor;
  final GetMyTasksController jobScreenController =
      Get.put(GetMyTasksController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final jobs = jobScreenController.myTasks.value;
      if (jobs == null) {
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ));
      } else if (jobs.data.tasks.isEmpty) {
        return Center(child: CustomText(text: 'No Jobs'));
      } else {
        return RefreshIndicator(
          color: AppColors.primaryColor,
          backgroundColor: AppColors.secondaryColor,
          onRefresh: () => jobScreenController.getMytasks(),
          child: ListView.builder(
              itemCount: jobs.data.tasks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final job = jobs.data.tasks[index];
                return BodyPadding(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    child: CustomJobCard(
                      id: job.jobId,
                      title: job.job.title,
                      status: job.job.status,
                      address: job.job.location,
                      dateTime: DateTime.parse(job.job.date),
                      time: job.job.time,
                      onViewDetails: () {},
                      onStartJob: () {},
                      isSupervisor: isSupervisor,
                    ),
                  ),
                );
              }),
        );
      }
    });
  }
}
