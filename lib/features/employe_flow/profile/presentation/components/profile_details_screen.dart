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
import 'package:planiq/features/employe_flow/profile/controller/profile_controller.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/profile_details_card.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appbarHeight: 70.h,
          backButton: true,
          title: "Profile Details",
        ),
        body: Obx(() {
          final profile = profileController.profile.value;
          if (profile == null) {
            return SizedBox.shrink();
          } else {
            return Column(
              children: [
                RefreshIndicator(
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                  onRefresh: () => profileController.getMyProfile(),
                  child: SingleChildScrollView(
                    child: BodyPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpace(height: 20.h),
                          Center(
                            child: CircleAvatar(
                              radius: 55.w,
                              backgroundColor: AppColors.secondaryColor,
                              backgroundImage:
                                  profile.data.profileImage.isNotEmpty
                                      ? NetworkImage(profile.data.profileImage)
                                      : AssetImage(IconPath.profileIcon),
                            ),
                          ),
                          VerticalSpace(height: 40.h),
                          CustomText(text: "Personal Details :"),
                          VerticalSpace(height: 20.h),
                          ProfileDetailsCard(
                              title: "Name :", data: profile.data.name),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "User ID:", data: profile.data.personId),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "Designation :",
                              data: profile.data.designation),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "Date of Birth :",
                              data: AppHelperFunctions.formatDate(
                                  profile.data.dateOfBirth)),
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
                                  children: profile.data.specialization
                                      .map((specialization) {
                                    return IntrinsicWidth(
                                      child: Container(
                                        height: 30.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                              title: "Role :", data: profile.data.job[0].role),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "Service Length :",
                              data: profile.data.job[0].serviceLength),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "Department :",
                              data: profile.data.job[0].department),
                          VerticalSpace(height: 10.h),
                          Divider(
                            color: Color(0xFFF1F2F6),
                          ),
                          CustomText(text: "Administrative Info :"),
                          VerticalSpace(height: 10.h),
                          ProfileDetailsCard(
                              title: "Joining Date :",
                              data: AppHelperFunctions.formatDate(
                                  profile.data.administrative[0].joinDate)),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "Work Location :",
                              data: profile.data.administrative[0].location),
                          VerticalSpace(height: 8.h),
                          ProfileDetailsCard(
                              title: "Employment Type :",
                              data:
                                  profile.data.administrative[0].employeeType),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }));
  }
}
