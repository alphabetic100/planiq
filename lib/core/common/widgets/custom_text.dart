import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;
  final String? fontFamily;
  final double? height;
  const CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.textOverflow,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.decoration,
    this.decorationColor,
    this.textAlign,
    this.fontFamily,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          height: height,
          fontFamily: fontFamily ?? GoogleFonts.figtree().fontFamily,
          decorationColor: decorationColor ?? AppColors.textPrimary,
          fontSize: fontSize ?? 16,
          color: color ?? AppColors.textPrimary,
          fontWeight: fontWeight ?? FontWeight.w600),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
