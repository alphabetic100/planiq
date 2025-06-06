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
import 'package:planiq/core/utils/values/profile_values.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/expanded_overview_card.dart';
import 'package:planiq/features/supervisor_flow/landing/controller/supervisor_landing_controller.dart';
import 'package:planiq/features/supervisor_flow/report_box/presentation/screen/report_box_view.dart';
import 'package:planiq/routes/app_routes.dart';

class SupervisorOverviewDrawer extends StatelessWidget {
  SupervisorOverviewDrawer({super.key});
  final SupervisorLandingController landingController =
      Get.put(SupervisorLandingController());

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
                    backgroundImage: ProfileValues.profileImage.isNotEmpty
                        ? NetworkImage(ProfileValues.profileImage.value)
                        : AssetImage(
                            IconPath.profileIcon,
                          ),
                  ),
                  title: CustomText(
                    text: ProfileValues.name.value,
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: CustomText(
                    text: "User ID: #${ProfileValues.personID.value}",
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
                      "title": "All",
                      "route": AppRoute.supervisorNotification,
                    },
                    {
                      "title": "My Notification",
                      "route": AppRoute.supervisorNotification,
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
                      "title": "All Task’s",
                      "route": AppRoute.supervisorJobScreen,
                    },
                    {
                      "title": "My Task’s",
                      "route": AppRoute.supervisorJobScreen,
                    },
                  ],
                  onSelect: () {},
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: false,
                  title: "Report Box",
                  onSelect: () {
                    Get.to(() => ReportBoxView());
                  },
                ),
                ExpandedOverviewCard(
                  isSelected: false,
                  isExpanded: false,
                  title: "Profile",
                  onSelect: () {
                    landingController.changePage(3);
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
