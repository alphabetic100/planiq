import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class ShowLogoutDialog extends StatelessWidget {
  const ShowLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Are you sure you want to Logout?",
                textAlign: TextAlign.center,
              ),
            ),
            VerticalSpace(height: 24.h),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  bordercolor: Color(0xff808080),
                  color: Color(0xff808080),
                  onTap: () {
                    Get.back();
                  },
                  title: "Cancel",
                )),
                HorizontalSpace(width: 16.w),
                Expanded(
                    child: CustomButton(
                  color: AppColors.error,
                  bordercolor: AppColors.error,
                  onTap: () {
                    AuthService.logoutUser();
                  },
                  title: "Proceed",
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
