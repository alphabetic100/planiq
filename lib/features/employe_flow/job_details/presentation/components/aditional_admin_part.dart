import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/employe_flow/job_details/model/assigned_task_model.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/employe_profile_details_screen.dart';

class AditionalAdminPart extends StatelessWidget {
  const AditionalAdminPart({super.key, required this.user, });
  final TaskData user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(height: 20.h),
        CustomText(
          text: "Assigned to",
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        VerticalSpace(height: 16.h),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.secondaryColor,
            backgroundImage: user.tasks[0].user.profileImage.isNotEmpty
                ? NetworkImage(user.tasks[0].user.profileImage)
                : AssetImage(IconPath.profileIcon),
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: user.tasks[0].user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextSpan(
                  text: " (${user.tasks[0].user.role.toLowerCase()})",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.36,
                child: CustomText(
                  text: "Employee ID: ${user.tasks[0].user.personId}",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textSecondary,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => EmployeProfileDetailsScreen(
                      employeeID: user.tasks[0].user.id));
                },
                child: CustomText(
                  text: "Employee  Details",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
