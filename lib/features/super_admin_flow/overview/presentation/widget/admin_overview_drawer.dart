import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_logo.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/expanded_overview_card.dart';
import 'package:planiq/routes/app_routes.dart';

class AdminOverviewDrawer extends StatelessWidget {
  const AdminOverviewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: AppColors.white,
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
                  leading: CircleAvatar(),
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
                  isSelected: true,
                  isExpanded: false,
                  title: "Overview",
                  onSelect: () {},
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: true,
                  title: "Notification",
                  options: [
                    {
                      "title": "Assign Accept Notification",
                      "route": AppRoute.landingPage,
                    },
                    {
                      "title": "Assign Decline Notification",
                      "route": AppRoute.landingPage,
                    },
                  ],
                  onSelect: () {
                    log("Selected");
                  },
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: true,
                  title: "Jobs",
                  options: [
                    {
                      "title": "All Jobs",
                      "route": AppRoute.landingPage,
                    },
                    {
                      "title": "Assigned Jobs",
                      "route": AppRoute.landingPage,
                    },
                    {
                      "title": "Unassigned Jobs",
                      "route": AppRoute.landingPage,
                    },
                    {
                      "title": "Completed Jobs",
                      "route": AppRoute.landingPage,
                    },
                  ],
                  onSelect: () {},
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: false,
                  title: "Employees",
                  onSelect: () {},
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: false,
                  title: "Profile",
                  onSelect: () {},
                )
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
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
