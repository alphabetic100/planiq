import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/core/utils/values/profile_values.dart';

class HomeProfileCard extends StatelessWidget {
  const HomeProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Obx(
            () => ListTile(
              leading: CircleAvatar(
                radius: 30.w,
                backgroundColor: AppColors.secondaryColor,
                backgroundImage: ProfileValues.profileImage.value.isEmpty
                    ? AssetImage(IconPath.profileIcon)
                    : NetworkImage(ProfileValues.profileImage.value),
              ),
              title: CustomText(
                text: "Welcome Back, ${ProfileValues.name.value}",
                color: AppColors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
              subtitle: CustomText(
                text: AppHelperFunctions.getCurrentDateTime(),
                color: AppColors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
