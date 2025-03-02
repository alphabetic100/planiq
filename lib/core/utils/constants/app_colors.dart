import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primaryColor = Color(0xFF00768A);
  static const Color secondaryColor = Color(0xFFD9F9FF);
  static const Color grey = Color(0xFFE3E7E8);
  static const Color green = Color(0xFF16A34A);
  static const Color black = Colors.black;
  static const Color borderColor = Color(0x7A959966);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xfffffa9e),
      Color(0xFFFAD0C4),
      Color(0xFFFAD0C4),
    ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF0F2326);
  static const Color textSecondary = Color(0xFF526366);
  static const Color white = Colors.white;

  // Background Colors
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFFFFFFF);

  // Surface Colors
  static const Color surfaceLight = Color(0xFFE0E0E0);
  static const Color surfaceDark = Color(0xFF2C2C2C);

  // Container Colors
  static const Color lightContainer = Color(0xFFF1F8E9);

  // Utility Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFD97706);
  static const Color error = Color(0xFFFF2C2C);
  static const Color info = Color(0xFF29B6F6);
}
