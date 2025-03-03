import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_logo.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BodyPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpace(height: 40.h),
                AppLogo(
                  color: AppColors.primaryColor,
                  width: 150.w,
                ),
                VerticalSpace(height: 40.h),
                CustomText(
                  text:
                      "Receive job assignments, track progress, and complete tasks easily.",
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.normal,
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                ),
                CustomText(
                  text: "Log in and get started!",
                  color: Color(0xFF526366),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                VerticalSpace(height: 60.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Enter ID",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    VerticalSpace(height: 8.h),
                    CustomTextField(
                      hintText: "Enter your id",
                    ),
                    VerticalSpace(height: 20.h),
                    CustomText(
                      text: "Password",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    VerticalSpace(height: 8.h),
                    CustomTextField(
                      hintText: "Enter your password",
                    ),
                    VerticalSpace(height: 32.h),
                    CustomButton(
                      onTap: () {
                        Get.toNamed(AppRoute.superLandingScreen);
                      },
                      title: "Log In",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
