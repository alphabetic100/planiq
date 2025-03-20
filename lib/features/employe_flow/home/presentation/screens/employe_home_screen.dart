import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/home/controller/employee_home_controller.dart';

import 'package:planiq/features/employe_flow/home/presentation/components/home_profile_card.dart';
import 'package:planiq/features/employe_flow/home/presentation/components/task_overview_section.dart';
import 'package:planiq/features/employe_flow/home/presentation/components/todays_schedule_section.dart';

class EmployeHomeScreen extends StatelessWidget {
  EmployeHomeScreen({super.key});
  final EmployeeHomeController homeController =
      Get.find<EmployeeHomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HomeProfileCard(),
        VerticalSpace(height: 30),
        Obx(() {
          final home = homeController.home.value;
          if (home == null) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              )),
            );
          } else if (home.data.data.result.isEmpty) {
            return Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.secondaryColor,
                onRefresh: () => homeController.getHomeData(),
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: BodyPadding(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TaskOverviewSection(
                              completed: home.data.data.completed.toString(),
                              scheduled: home.data.data.schedule.toString(),
                            ),
                            VerticalSpace(height: 30.h),
                            CustomText(text: 'No task scheduled for today')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            final task = home.data.data.result.first;
            return Expanded(
              child: BodyPadding(
                  child: RefreshIndicator(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.secondaryColor,
                onRefresh: () => homeController.getHomeData(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomJobCard(
                        id: task.job.id,
                        title: task.job.title,
                        status: 'Starting soon',
                        address: task.job.location,
                        dateTime: DateTime.parse(task.job.date),
                        time: task.job.time.toString(),
                        onViewDetails: () {},
                        onStartJob: () {
                          homeController.startJob(task.jobId);
                        },
                      ),
                      VerticalSpace(height: 30.h),
                      TaskOverviewSection(
                        completed: home.data.data.completed.toString(),
                        scheduled: home.data.data.schedule.toString(),
                      ),
                      VerticalSpace(height: 30.h),
                      TodaysScheduleSection(
                        task: home.data.data,
                      )
                    ],
                  ),
                ),
              )),
            );
          }
        })
      ],
    ));
  }
}
