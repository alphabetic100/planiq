import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/all_jobs_list.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/assigned_job_list.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/compleated_jobs_list.dart';
import 'package:planiq/features/supervisor_flow/jobs/presentation/components/wip_job_list.dart';

class SupervisorJobsScreen extends StatefulWidget {
  const SupervisorJobsScreen({super.key});

  @override
  State<SupervisorJobsScreen> createState() => _SupervisorJobsScreenState();
}

class _SupervisorJobsScreenState extends State<SupervisorJobsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  int selectedTab = 0;
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
          )
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
              SizedBox(
                height: 55.h,
                child: Center(
                    child: CustomText(
                  text: "All",
                  fontSize: selectedTab == 0 ? 16 : 14,
                  fontWeight:
                      selectedTab == 0 ? FontWeight.w500 : FontWeight.normal,
                  color: selectedTab == 0
                      ? AppColors.primaryColor
                      : AppColors.textSecondary,
                )),
              ),
              SizedBox(
                height: 55.h,
                child: Center(
                    child: CustomText(
                  text: "Scheduled",
                  fontSize: selectedTab == 1 ? 16 : 14,
                  fontWeight:
                      selectedTab == 1 ? FontWeight.w500 : FontWeight.normal,
                  color: selectedTab == 1
                      ? AppColors.primaryColor
                      : AppColors.textSecondary,
                )),
              ),
              SizedBox(
                height: 55.h,
                child: Center(
                    child: CustomText(
                  text: "WIP",
                  fontSize: selectedTab == 2 ? 16 : 14,
                  fontWeight:
                      selectedTab == 2 ? FontWeight.w500 : FontWeight.normal,
                  color: selectedTab == 2
                      ? AppColors.primaryColor
                      : AppColors.textSecondary,
                )),
              ),
              SizedBox(
                height: 55.h,
                child: Center(
                    child: CustomText(
                  text: "Completed",
                  fontSize: selectedTab == 3 ? 16 : 14,
                  fontWeight:
                      selectedTab == 3 ? FontWeight.w500 : FontWeight.normal,
                  color: selectedTab == 3
                      ? AppColors.primaryColor
                      : AppColors.textSecondary,
                )),
              ),
            ],
          ),
          VerticalSpace(height: 20),
          // BodyPadding(child: JobScreenTopBar(onSearch: (value) {})),
          Expanded(
            child: BodyPadding(
              child: TabBarView(
                controller: controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  AllJobsList(),
                  AssignedJobList(),
                  WIPJobList(),
                  CompleatedJobsList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
