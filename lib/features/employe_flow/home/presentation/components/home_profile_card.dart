import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/image_path.dart';

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
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.w,
              backgroundColor: AppColors.secondaryColor,
              backgroundImage: AssetImage(ImagePath.appLogo),
            ),
            title: CustomText(
              text: "Welcome Back, David",
              color: AppColors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
            subtitle: CustomText(
              text: "Monday, January 17",
              color: AppColors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
