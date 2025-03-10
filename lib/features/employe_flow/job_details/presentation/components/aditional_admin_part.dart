import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';

class AditionalAdminPart extends StatelessWidget {
  const AditionalAdminPart({super.key});

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
            backgroundImage: AssetImage(IconPath.profileIcon),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Alex Thompson",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextSpan(
                      text: " (Employee)",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.delete_outlined,
                color: AppColors.primaryColor,
              )
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Employee ID: 12548",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.textSecondary,
              ),
              CustomText(
                text: "Employee  Details",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
