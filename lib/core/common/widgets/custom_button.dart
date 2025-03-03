import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      required this.onTap,
      required this.title,
      this.color,
      this.radious,
      this.padding,
      this.isPrimary = true,
      this.titleColor = AppColors.white});

  final double? height;
  final double? width;
  final VoidCallback onTap;
  final String title;
  final Color? color;
  final double? radious;
  final double? padding;
  final bool isPrimary;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 44,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(AppColors.primaryColor.withOpacity(0.3)),
          padding: WidgetStatePropertyAll(EdgeInsets.all(padding ?? 8)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radious ?? 8),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
              color ?? (isPrimary ? AppColors.primaryColor : AppColors.white)),
        ),
        onPressed: onTap,
        child: CustomText(
          text: title,
          color: titleColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
