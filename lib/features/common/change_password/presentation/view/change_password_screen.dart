import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/validators/app_validator.dart';
import 'package:planiq/features/common/change_password/controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Change Password',
        appbarHeight: 70.h,
        backButton: true,
      ),
      body: BodyPadding(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: 20.h),
              CustomText(text: "Current Password"),
              VerticalSpace(height: 10.h),
              CustomTextField(
                controller: oldPasswordController,
                hintText: "Enter your current password",
                validator: AppValidator.validatePassword,
              ),
              VerticalSpace(height: 20.h),
              CustomText(text: "New Password"),
              VerticalSpace(height: 10.h),
              CustomTextField(
                controller: newPasswordController,
                hintText: "Enter your new password",
                validator: AppValidator.validatePassword,
              ),
              VerticalSpace(height: 40.h),
              CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      changePasswordController.changePassword(
                        oldPasswordController.text.trim(),
                        newPasswordController.text.trim(),
                      );
                    }
                  },
                  title: "Change Password"),
            ],
          ),
        ),
      ),
    );
  }
}
