import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/jobs/controller/job_screen_controller.dart';
import 'package:planiq/features/employe_flow/jobs/presentation/components/all_jobs_screen.dart';
import 'package:planiq/features/employe_flow/jobs/presentation/components/compleated_job_screen.dart';

class EmployeJobsScreen extends StatefulWidget {
  const EmployeJobsScreen({super.key});

  @override
  State<EmployeJobsScreen> createState() => _EmployeJobsScreenState();
}

class _EmployeJobsScreenState extends State<EmployeJobsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final JobScreenController jobScreenController =
      Get.put(JobScreenController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appbarHeight: 70.h,
          title: "Jobs",
        ),
        body: Column(
          children: [
            VerticalSpace(height: 20.h),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: Color(0xFFE3E7E8)),
              child: Obx(
                () => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        jobScreenController.changeTab(1);
                        _tabController.animateTo(0);
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: jobScreenController.selectedTab.value == 1
                              ? AppColors.primaryColor
                              : Color(0xFFE3E7E8),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Center(
                          child: CustomText(
                            text: "All Jobs",
                            color: jobScreenController.selectedTab.value == 1
                                ? AppColors.white
                                : Color(0xFF7A9599),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        jobScreenController.changeTab(2);
                        _tabController.animateTo(1);
                      },
                      child: Container(
                        height: 45.h,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: jobScreenController.selectedTab.value == 2
                              ? AppColors.primaryColor
                              : Color(0xFFE3E7E8),
                        ),
                        child: Center(
                          child: CustomText(
                            text: "Completed Jobs",
                            color: jobScreenController.selectedTab.value == 2
                                ? AppColors.white
                                : Color(0xFF7A9599),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            VerticalSpace(height: 10.h),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children:  [AllJobsScreen(), CompleatedJobScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
