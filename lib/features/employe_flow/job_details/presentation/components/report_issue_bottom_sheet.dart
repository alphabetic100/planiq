import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/job_details/controller/job_detail_screen_controller.dart';

class ReportIssueBottomSheet extends StatelessWidget {
  ReportIssueBottomSheet({super.key, required this.jobID});
  final String jobID;
  final TextEditingController reportIssueCT = TextEditingController();
  final JobDetailScreenController jobDetailScreenController =
      Get.put(JobDetailScreenController());
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
              controller: reportIssueCT,
              maxLines: 4,
              hintText: "Write your issue here...",
            ),
            Spacer(),
            CustomButton(
                onTap: () {
                  if (reportIssueCT.text.isEmpty) {
                    errorSnakbar(
                        errorMessage: "Please write a issue for submit");
                  } else {

                    jobDetailScreenController.reportIssue(reportIssueCT.text.trim(), jobID);
                  }
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
