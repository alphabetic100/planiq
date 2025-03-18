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
import 'package:planiq/core/utils/validators/app_validator.dart';
import 'package:planiq/features/common/authentication/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BodyPadding(
            child: Form(
              key: formKey,
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
                        keyboardType: TextInputType.numberWithOptions(),
                        onChange: (value) {},
                        controller: emailController,
                        hintText: "Enter your id",
                        validator: AppValidator.validateID,
                        numberOnly: true,
                      ),
                      VerticalSpace(height: 20.h),
                      CustomText(
                        text: "Password",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      VerticalSpace(height: 8.h),
                      CustomTextField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: passwordController,
                        hintText: "Enter your password",
                        validator: AppValidator.validatePassword,
                      ),
                      VerticalSpace(height: 32.h),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            loginController.logIN(emailController.text.trim(),
                                passwordController.text.trim());
                            clearTextFields();
                          }
                          // Get.toNamed(AppRoute.supervisorLandingScreen);
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
      ),
    );
  }
}
