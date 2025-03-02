import 'package:flutter/material.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static ElevatedButtonThemeData _baseTheme({
    required Color defaultTextColor,
    required Color disabledTextColor,
    required Color defaultBackgroundColor,
    required Color disabledBackgroundColor,
    required Color borderColor,
  }) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.disabled)
              ? disabledTextColor
              : defaultTextColor,
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.disabled)
              ? disabledBackgroundColor
              : defaultBackgroundColor,
        ),
        side: WidgetStateProperty.all(BorderSide(color: borderColor)),
        padding:
            const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 18)),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static final ElevatedButtonThemeData lightElevatedButtonTheme = _baseTheme(
    defaultTextColor: Colors.white,
    disabledTextColor: Colors.grey,
    defaultBackgroundColor: AppColors.primaryColor,
    disabledBackgroundColor: Colors.grey.shade300,
    borderColor: Colors.blue,
  );
}
