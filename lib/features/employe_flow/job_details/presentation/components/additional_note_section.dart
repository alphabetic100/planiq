import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class AdditionalNoteSection extends StatelessWidget {
  const AdditionalNoteSection({super.key});

  @override
  Widget build(BuildContext context) {
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
