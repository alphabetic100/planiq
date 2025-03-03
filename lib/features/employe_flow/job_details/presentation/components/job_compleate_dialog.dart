import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/features/employe_flow/job_details/controller/payment_method_controller.dart';

class JobCompleateDialog extends StatelessWidget {
  JobCompleateDialog({super.key});
  final PaymentMethodController methodController =
      Get.put(PaymentMethodController());
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
              final selected = methodController.selectedType.value;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => methodController.changeMethod("CASH"),
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
                                methodController.changeMethod(value);
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
                    onTap: () => methodController.changeMethod("BANCONTACT"),
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
                                methodController.changeMethod(value);
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
            CustomButton(onTap: () {}, title: "Confirm")
          ],
        ),
      ),
    );
  }
}
