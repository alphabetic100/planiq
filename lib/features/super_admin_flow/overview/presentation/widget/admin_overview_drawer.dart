import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_logo.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/show_logout_dialog.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/admin_profile/presentation/screens/admin_profile_screen.dart';
import 'package:planiq/features/super_admin_flow/landing/controllers/super_landing_controller.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/expanded_overview_card.dart';
import 'package:planiq/routes/app_routes.dart';

class AdminOverviewDrawer extends StatelessWidget {
  AdminOverviewDrawer({super.key});
  final SuperLandingController landingController =
      Get.put(SuperLandingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Color(0xffF1F2F6),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primaryColor),
            child: Column(
              children: [
                AppLogo(
                  height: 48.h,
                ),
                Spacer(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    backgroundImage: AssetImage(
                      IconPath.profileIcon,
                    ),
                  ),
                  title: CustomText(
                    text: "David Batista",
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: CustomText(
                    text: "User ID: #44458",
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 5,
                spreadRadius: 3,
                offset: Offset(-4, 4),
              ),
            ]),
            child: Column(
              children: [
                ExpandedOverviewCard(
                  isSelected: landingController.currentPage.value == 0,
                  isExpanded: false,
                  title: "Overview",
                  onSelect: () {},
                ),
                ExpandedOverviewCard(
                  isSelected: landingController.currentPage.value == 1,
                  isExpanded: true,
                  title: "Notification",
                  options: [
                    {
                      "title": "Assign Accept Notification",
                      "route": AppRoute.adminNotificationScreen,
                    },
                    {
                      "title": "Assign Decline Notification",
                      "route": AppRoute.adminNotificationScreen,
                    },
                  ],
                  onSelect: () {
                    log("Selected");
                  },
                ),
                ExpandedOverviewCard(
                  isSelected: landingController.currentPage.value == 2,
                  isExpanded: true,
                  title: "Jobs",
                  options: [
                    {
                      "title": "All Jobs",
                      "route": AppRoute.adminJobScreen,
                    },
                    {
                      "title": "Assigned Jobs",
                      "route": AppRoute.adminJobScreen,
                    },
                    {
                      "title": "Unassigned Jobs",
                      "route": AppRoute.adminJobScreen,
                    },
                    {
                      "title": "Completed Jobs",
                      "route": AppRoute.adminJobScreen,
                    },
                  ],
                  onSelect: () {
                    landingController.changePage(3);
                  },
                ),
                ExpandedOverviewCard(
                  isSelected: landingController.currentPage.value == 2,
                  isExpanded: false,
                  title: "Employees",
                  onSelect: () {
                    landingController.changePage(3);
                  },
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: false,
                  title: "Profile",
                  onSelect: () {
                    Get.to(() => AdminProfileScreen());
                  },
                )
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ShowLogoutDialog();
                  });
            },
            child: Container(
              height: 60.h,
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: AppColors.error,
                  ),
                  HorizontalSpace(width: 5.w),
                  CustomText(
                    text: "Logout",
                    color: Color(0xFFFC2D2D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
