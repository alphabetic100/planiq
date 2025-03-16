import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/profile_details_card.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/employee_profile_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/employe_profile_overview.dart';

class EmployeProfileDetailsScreen extends StatefulWidget {
  const EmployeProfileDetailsScreen({
    super.key,
    required this.employeeID,
    this.isFromBooking = false,
    this.taskID = "",
  });
  final String employeeID;
  final bool isFromBooking;
  final String taskID;

  @override
  State<EmployeProfileDetailsScreen> createState() =>
      _EmployeProfileDetailsScreenState();
}

class _EmployeProfileDetailsScreenState
    extends State<EmployeProfileDetailsScreen> {
  final EmployeeProfileController employeeController =
      Get.put(EmployeeProfileController());

  final List<String> iconPath = [
    IconPath.editIcon,
    IconPath.blockIcon,
    IconPath.shildICon,
  ];

  final List<String> titles = [
    "Edit Details",
    "Block Employee",
    "Make Supervisor",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      employeeController.getProfileDetails(widget.employeeID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        backButton: true,
        title: "Profile Details",
        actions: [
          PopupMenuButton<int>(
            iconColor: AppColors.white,
            color: AppColors.white,
            onSelected: (int value) {
              log("Selected action: ${titles[value]}");
              employeeController.handleProfileAction(
                  titles[value], widget.employeeID);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            BodyPadding(child: Obx(() {
              if (employeeController.profile.value == null) {
                return SizedBox.shrink();
              } else {
                final profile = employeeController.profile.value!.data;
                employeeController.employeeID.value = profile.id;
                employeeController.employeeName.value = profile.name;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(height: 20.h),
                    Center(
                      child: CircleAvatar(
                        radius: 55.w,
                        backgroundColor: AppColors.secondaryColor,
                        backgroundImage: profile.profileImage.isNotEmpty
                            ? NetworkImage(profile.profileImage)
                            : AssetImage(IconPath.profileIcon),
                      ),
                    ),
                    VerticalSpace(height: 40.h),
                    CustomText(text: "Personal Details :"),
                    VerticalSpace(height: 20.h),
                    ProfileDetailsCard(
                        title: "Name :",
                        data: profile.name.isEmpty ? "Guest" : profile.name),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                        title: "User ID",
                        data: profile.id.isNotEmpty
                            ? profile.personId
                            : "XXXXXX"),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                        title: "Designation :",
                        data: profile.designation.isNotEmpty
                            ? profile.designation
                            : "N/A"),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                      title: "Date of Birth :",
                      data: AppHelperFunctions.backendFomater(
                              profile.dateOfBirth.toString()) ??
                          "N/A",
                    ),
                    VerticalSpace(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Specialization : ",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textSecondary,
                        ),
                        HorizontalSpace(width: 5),
                        Expanded(
                          child: Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children:
                                profile.specialization.map((specialization) {
                              return IntrinsicWidth(
                                child: Container(
                                  height: 30.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFFEFF7F9),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: specialization,
                                      color: Color(0xFF526366),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpace(height: 10.h),
                    Divider(
                      color: Color(0xFFF1F2F6),
                    ),
                    CustomText(text: "Job Details :"),
                    VerticalSpace(height: 10.h),
                    ProfileDetailsCard(
                        title: "Role :",
                        data: profile.job[0].role.isNotEmpty
                            ? profile.job[0].role
                            : "N/A"),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                        title: "Service Length :",
                        data: profile.job[0].serviceLength.isNotEmpty
                            ? profile.job[0].serviceLength
                            : "N/A"),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                        title: "Department :",
                        data: profile.job[0].department.isNotEmpty
                            ? profile.job[0].department
                            : "Plumbing Operations"),
                    VerticalSpace(height: 10.h),
                    Divider(
                      color: Color(0xFFF1F2F6),
                    ),
                    CustomText(text: "Administrative Info :"),
                    VerticalSpace(height: 10.h),
                    ProfileDetailsCard(
                        title: "Joining Date :",
                        data: AppHelperFunctions.backendFomater(profile
                                .administrative[0].joinDate
                                .toString()) ??
                            "N/A"),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                        title: "Work Location :",
                        data: profile.administrative[0].location.isNotEmpty
                            ? profile.administrative[0].location
                            : "N/A"),
                    VerticalSpace(height: 8.h),
                    ProfileDetailsCard(
                        title: "Employment Type :",
                        data: profile.administrative[0].employeeType.isNotEmpty
                            ? profile.administrative[0].employeeType
                            : "N/A"),
                    VerticalSpace(height: 24.h),
                    CustomText(text: "Project Overview"),
                    VerticalSpace(height: 20.h),
                    EmployeProfileOverview(
                      taskID: widget.taskID,
                      totalJob: profile.totalJobs.toString(),
                      compleated: profile.completedJobs.toString(),
                      scheduled: profile.accepted.toString(),
                      declined: profile.decline.toString(),
                      isFromBooking: widget.isFromBooking,
                      employeID: profile.id,
                    ),
                  ],
                );
              }
            })),
          ],
        ),
      ),
    );
  }
}
