import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/profile_details_card.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});
  final List<String> profileSpecialization = [
    "Drain Cleaning",
    "Installation",
    "Pipe Repair"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        backButton: true,
        title: "Profile Details",
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: BodyPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(height: 20.h),
                  Center(
                    child: CircleAvatar(
                      radius: 55.w,
                      backgroundColor: AppColors.secondaryColor,
                    ),
                  ),
                  VerticalSpace(height: 40.h),
                  CustomText(text: "Personal Details :"),
                  VerticalSpace(height: 20.h),
                  ProfileDetailsCard(title: "Name :", data: "David Andrew"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(title: "User ID", data: "11226"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(title: "Designation :", data: "Plumber"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(
                      title: "Date of Birth :", data: "24/08/1996"),
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
                          children: profileSpecialization.map((specialization) {
                            return IntrinsicWidth(
                              child: Container(
                                height: 30.h,
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                  ProfileDetailsCard(title: "Role :", data: "Senior Plumber"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(
                      title: "Service Length :", data: "2 Years 3 Months"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(
                      title: "Department :", data: "Plumbing Operations"),
                  VerticalSpace(height: 10.h),
                  Divider(
                    color: Color(0xFFF1F2F6),
                  ),
                  CustomText(text: "Administrative Info :"),
                  VerticalSpace(height: 10.h),
                  ProfileDetailsCard(
                      title: "Joining Date :", data: "01/04/2023"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(
                      title: "Work Location :", data: "New York City, NY"),
                  VerticalSpace(height: 8.h),
                  ProfileDetailsCard(
                      title: "Employment Type :", data: "Permanent"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
