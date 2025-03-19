import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/employe_flow/job_details/model/job_details_model.dart';

class AdditionalNoteSection extends StatelessWidget {
  const AdditionalNoteSection({super.key, required this.details});
  final JobData details;
  @override
  Widget build(BuildContext context) {
    if (!(details.workPhoto.isNotEmpty || details.notes != null)) {
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
                _paymentDetails("Payment Method :", "Cash", FontWeight.bold),
                _paymentDetails(
                    "Payment Amount :", "€ 142.18", FontWeight.bold),
                details.notes != null
                    ? _paymentDetails("Payment Method :", details.notes ?? "",
                        FontWeight.w500)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          if (details.workPhoto.isEmpty) ...[
            VerticalSpace(height: 20),
            CustomText(
              text: "Uploaded work photos",
              fontSize: 18,
            ),
            VerticalSpace(height: 10),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(IconPath.profileIcon),
                    ),
                  );
                })
          ]
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
          ElevatedButton(
              style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(
                      AppColors.primaryColor.withOpacity(0.1)),
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: AppColors.primaryColor,
                  ),
                  HorizontalSpace(width: 10),
                  CustomText(
                    text: "Upload Photo",
                    color: AppColors.primaryColor,
                  )
                ],
              )),
          VerticalSpace(height: 20),
          CustomText(
            text: "Additional Notes",
            fontSize: 20,
          ),
          VerticalSpace(height: 20),
          CustomTextField(
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
