import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/features/employe_flow/job_details/controller/job_detail_screen_controller.dart';

class JobCompleateDialog extends StatelessWidget {
  JobCompleateDialog({super.key, required this.jobID});
  final JobDetailScreenController jobController =
      Get.find<JobDetailScreenController>();
  final TextEditingController paymentController = TextEditingController();
  final TextEditingController extraNoteCT = TextEditingController();
  final String jobID;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.black,
                    ))
              ],
            ),
            CustomText(
              text: "Payment Amount",
              fontWeight: FontWeight.w700,
            ),
            VerticalSpace(height: 10),
            CustomTextField(
              controller: paymentController,
              keyboardType: TextInputType.numberWithOptions(),
              numberOnly: true,
              prefixIcon: SizedBox(
                width: 40,
                child: Center(
                  child: CustomText(
                    text: "€",
                    color: AppColors.primaryColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            VerticalSpace(height: 20),
            CustomText(
              text: "Extra Note",
              fontWeight: FontWeight.w700,
            ),
            VerticalSpace(height: 10),
            CustomTextField(
              controller: extraNoteCT,
              maxLines: 3,
              hintText: "Write your note here...",
            ),
            VerticalSpace(height: 20),
            CustomText(
              text: "Payment Method",
              fontWeight: FontWeight.w700,
            ),
            VerticalSpace(height: 10),
            Obx(() {
              final selected = jobController.selectedType.value;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => jobController.changeMethod("CASH"),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFEBF1FF)),
                        color: selected == "CASH"
                            ? AppColors.secondaryColor
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Cash"),
                          Radio<String>(
                            value: "CASH",
                            groupValue:
                                selected, // FIXED: should match selected type
                            onChanged: (value) {
                              if (value != null) {
                                jobController.changeMethod(value);
                              }
                            },
                            fillColor: WidgetStateProperty.all(
                              selected == "CASH"
                                  ? AppColors.primaryColor
                                  : null,
                            ),
                            activeColor: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalSpace(height: 20),
                  GestureDetector(
                    onTap: () => jobController.changeMethod("BANCONTACT"),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFEBF1FF)),
                        color: selected == "BANCONTACT"
                            ? AppColors.secondaryColor
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "BanContact"),
                          Radio<String>(
                            value: "BANCONTACT",
                            groupValue: selected, // FIXED
                            onChanged: (value) {
                              if (value != null) {
                                jobController.changeMethod(value);
                              }
                            },
                            fillColor: WidgetStateProperty.all(
                              selected == "BANCONTACT"
                                  ? AppColors.primaryColor
                                  : null,
                            ),
                            activeColor: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
            VerticalSpace(height: 20),
            CustomButton(
                onTap: () {
                  Get.back();
                  jobController.compleateTask(jobID,
                      paymentController.text.trim(), extraNoteCT.text.trim());
                },
                title: "Confirm")
          ],
        ),
      ),
    );
  }
}
