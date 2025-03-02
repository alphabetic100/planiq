import 'package:flutter/material.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.onTap,
    required this.child,
    this.color,
    this.radious,
    this.padding,
    this.isPrimary = true,
  });

  final double? height;
  final double? width;
  final VoidCallback onTap;
  final Widget child;
  final Color? color;
  final double? radious;
  final double? padding;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 44,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(padding ?? 8)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radious ?? 8),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(color ??
                (isPrimary ? AppColors.primaryColor : AppColors.white)),
          ),
          onPressed: onTap,
          child: child),
    );
  }
}
