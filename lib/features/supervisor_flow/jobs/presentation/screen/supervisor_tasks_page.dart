import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Job",
        actions: [
          PopupMenuButton(
            color: AppColors.white,
            iconColor: AppColors.white,
            popUpAnimationStyle: AnimationStyle(
              curve: Curves.easeInCirc,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(IconPath.excelIcon),
                      HorizontalSpace(width: 5),
                      CustomText(
                        text: "Export Task Data",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF526366),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(IconPath.excelIcon),
                      HorizontalSpace(width: 5),
                      CustomText(
                        text: "Export Customer List",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF526366),
                      )
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          VerticalSpace(height: 10.h),
          TabBar(
            controller: controller,
            indicator: BoxDecoration(
              color: Colors.transparent,
            ),
            dividerColor: Colors.transparent,
            tabs: [
              Container(
                height: 55.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: CustomText(
                    text: "All Jobs",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
              Container(
                height: 55.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: CustomText(
                    text: "My Jobs",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
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
                SizedBox(
                  child: SupervisorJobsScreen(),
                ),
                SizedBox(
                  child: SupervisorJobsScreen(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
