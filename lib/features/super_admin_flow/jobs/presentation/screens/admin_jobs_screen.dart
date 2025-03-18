import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/all_jobs_controller.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/jobs_controller.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/all_jobs_list.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/assigned_job_list.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/compleated_jobs_list.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/job_screen_top_bar.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/search_result_widget.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/unassigned_job_list.dart'; // Import new widget

class AdminJobsScreen extends StatefulWidget {
  const AdminJobsScreen({super.key});

  @override
  State<AdminJobsScreen> createState() => _AdminJobsScreenState();
}

class _AdminJobsScreenState extends State<AdminJobsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final JobsController jobsController = Get.put(JobsController());
  String searchQuery = "";
  final AllJobsController allJobsController = Get.put(AllJobsController());

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  int selectedTab = 0;
  final List<String> iconPath = [
    'assets/icons/excel.png',
  ];
  final List<String> titles = [
    "Export Task Data",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Job",
        actions: [
          PopupMenuButton<int>(
            iconColor: AppColors.white,
            color: AppColors.white,
            onSelected: (int value) {
              jobsController.handelEmployeeAction(titles[value]);
            },
            itemBuilder: (context) => List.generate(
              titles.length,
              (index) => PopupMenuItem<int>(
                value: index,
                child: Row(
                  children: [
                    Image.asset(
                      iconPath[index],
                    ),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: titles[index],
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: controller,
            indicator: BoxDecoration(
              color: Color(0xFFD9F9FF),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            dividerColor: Color(0xFFF1F2F6),
            labelPadding: EdgeInsets.all(0),
            onTap: (value) {
              setState(() {
                selectedTab = value;
                log(value.toString());
              });
            },
            tabs: [
              _tabBarItem("All", 0),
              _tabBarItem("Assigned", 1),
              _tabBarItem("Unassigned", 2),
              _tabBarItem("Completed", 3),
            ],
          ),
          VerticalSpace(height: 20),
          BodyPadding(child: JobScreenTopBar(onSearch: (value) {
            setState(() {
              searchQuery = value;
              allJobsController.filterJobs(value);
            });
          })),
          VerticalSpace(height: 20),
          Expanded(
            child: BodyPadding(
              child: searchQuery.isEmpty
                  ? TabBarView(
                      controller: controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        AllJobsList(isFromAdmin: true),
                        AssignedJobList(isFromAdmin: true),
                        UnassignedJobList(isFromAdmin: true),
                        CompleatedJobsList(isFromAdmin: true),
                      ],
                    )
                  : SearchResultsWidget(
                      jobs: allJobsController.filteredJobs.value,
                      isFromAdmin: true,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBarItem(String label, int index) {
    return SizedBox(
      height: 55.h,
      child: Center(
        child: CustomText(
          text: label,
          fontSize: selectedTab == index ? 16 : 14,
          fontWeight:
              selectedTab == index ? FontWeight.w500 : FontWeight.normal,
          color: selectedTab == index
              ? AppColors.primaryColor
              : AppColors.textSecondary,
        ),
      ),
    );
  }
}
