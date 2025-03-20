import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/employe_flow/job_details/controller/additional_notes_controller.dart';
import 'package:planiq/features/employe_flow/job_details/model/job_details_model.dart';

class AdditionalNoteSection extends StatelessWidget {
  AdditionalNoteSection({super.key, required this.details});
  final JobData details;
  final AdditionalNotesController additionalNotesController =
      Get.put(AdditionalNotesController());
  @override
  Widget build(BuildContext context) {
    if ((details.workPhoto.isNotEmpty || details.notes != null)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.5),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 12),
                    CustomText(
                      text: "Receive Payment",
                      color: Color(0xFF7A9599),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Divider(
                  color: Color(0xD9D9D999).withOpacity(0.6),
                ),
                _paymentDetails("Payment Method :",
                    details.payment[0].paymentMethod, FontWeight.bold),
                _paymentDetails("Payment Amount :",
                    "€ ${details.payment[0].amount}", FontWeight.bold),
                details.notes != null
                    ? _paymentDetails("Extra note :", details.payment[0].note,
                        FontWeight.w500)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          if (details.workPhoto.isNotEmpty) ...[
            VerticalSpace(height: 20),
            CustomText(
              text: "Uploaded work photos",
              fontSize: 18,
            ),
            VerticalSpace(height: 10),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 12 / 13),
                itemCount: details.workPhoto.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(details.workPhoto[index]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                }),
            if (details.notes != null) ...[
              if (details.notes!.isNotEmpty) ...[
                VerticalSpace(height: 20),
                CustomText(
                  text: "AdiAdditional Notes",
                  fontSize: 18,
                ),
                VerticalSpace(height: 10),
                CustomText(
                  text: details.notes ?? "",
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                )
              ],
            ],
          ],
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(height: 24),
          CustomText(
            text: "Upload your work",
            fontSize: 20.sp,
          ),
          VerticalSpace(height: 10),
          Obx(
            () => additionalNotesController.images.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: additionalNotesController.images.length < 6
                        ? additionalNotesController.images.length + 1
                        : 6,
                    itemBuilder: (context, index) {
                      if (index < additionalNotesController.images.length) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(additionalNotesController.images[index]),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => additionalNotesController
                                    .removeImage(index),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(4),
                                    child: Image.asset(IconPath.deleteIcon)),
                              ),
                            )
                          ],
                        );
                      } else if (additionalNotesController.images.isNotEmpty) {
                        return GestureDetector(
                          onTap: () {
                            additionalNotesController.pickImages();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.secondaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(height: 5),
                                Text("Add Photo",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    )),
                                Text(
                                    "${additionalNotesController.images.length}/6 Photos",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                  )
                : SizedBox.shrink(),
          ),
          Obx(() => additionalNotesController.images.isEmpty
              ? Column(
                  children: [
                    VerticalSpace(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                              AppColors.primaryColor.withOpacity(0.1)),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                      onPressed: additionalNotesController.pickImages,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: AppColors.primaryColor,
                          ),
                          HorizontalSpace(width: 10),
                          CustomText(
                            text: "Select Photo",
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                    VerticalSpace(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Add Up to 6 Photos",
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink()),
          VerticalSpace(height: 20),
          CustomText(
            text: "Additional Notes",
            fontSize: 20,
          ),
          VerticalSpace(height: 20),
          CustomTextField(
            onChange: (value) {
              additionalNotesController.additionalNotes.value = value;
            },
            maxLines: 4,
            hintText: "Add your notes here...",
          ),
        ],
      );
    }
  }

  Widget _paymentDetails(String title, String detail, FontWeight fontWeight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: Color(0xFF526366),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        HorizontalSpace(width: 10),
        Expanded(
            child: CustomText(
          text: detail,
          color: AppColors.textPrimary,
          fontWeight: fontWeight,
          fontSize: 16,
        ))
      ],
    );
  }
}
