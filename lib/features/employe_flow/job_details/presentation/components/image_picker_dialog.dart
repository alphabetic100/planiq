import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key, required this.fromGaleary});
  final Function(bool value) fromGaleary;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: "Pick Image from"),
            VerticalSpace(height: 20),
            CustomButton(
              onTap: () {
                fromGaleary.call(true);
                Get.back();
              },
              title: "From galleary",
              isChild: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    color: AppColors.white,
                  ),
                  HorizontalSpace(width: 10),
                  CustomText(
                    text: "From gallery",
                    color: AppColors.white,
                  )
                ],
              ),
            ),
            VerticalSpace(height: 10),
            CustomButton(
              onTap: () {
                fromGaleary.call(false);
                Get.back();
              },
              title: "Capture photo",
              isChild: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                  ),
                  HorizontalSpace(width: 10),
                  CustomText(
                    text: "Capture photo",
                    color: AppColors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
