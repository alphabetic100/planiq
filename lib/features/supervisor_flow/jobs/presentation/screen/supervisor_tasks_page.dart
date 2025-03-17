import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/jobs_controller.dart';
import 'package:planiq/features/supervisor_flow/jobs/presentation/screen/super_jobs_list.dart';
import 'package:planiq/features/supervisor_flow/jobs/presentation/screen/supervisor_job_screen.dart';

class SupervisorTasksPage extends StatefulWidget {
  const SupervisorTasksPage({super.key});

  @override
  State<SupervisorTasksPage> createState() => _SupervisorTasksPageState();
}

class _SupervisorTasksPageState extends State<SupervisorTasksPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  final List<String> iconPath = [
    IconPath.excelIcon,
  ];
  final List<String> titles = [
    "Export Task Data",
  ];
  final JobsController jobsController = Get.put(JobsController());
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
          VerticalSpace(height: 10.h),
          TabBar(
            controller: controller,
            indicator: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            dividerColor: Colors.transparent,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.primaryColor,
            tabs: [
              SizedBox(
                height: 55.h,
                width: 150.w,
                child: Center(
                  child: Text(
                    "All Jobs",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 55.h,
                width: 150.w,
                child: Center(
                  child: Text(
                    "My Jobs",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          VerticalSpace(height: 10.h),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                SupervisorJobsScreen(),
                SuperJobList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
