import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class ReportIssueBottomSheet extends StatelessWidget {
  const ReportIssueBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: BodyPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 80.w,
                    child: Divider(
                      color: AppColors.black,
                      thickness: 2,
                    ))
              ],
            ),
            VerticalSpace(height: 40),
            CustomText(text: "Report Issue"),
            VerticalSpace(height: 20),
            CustomTextField(
              maxLines: 4,
              hintText: "Write your issue here...",
            ),
            Spacer(),
            CustomButton(
                onTap: () {
                  Get.back();
                },
                title: "Submit Issue"),
            VerticalSpace(height: 20.h),
          ],
        ),
      ),
    );
  }
}
