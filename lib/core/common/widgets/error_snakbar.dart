import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

errorSnakbar({String? errorMessage}) {
  return Future.delayed(Duration(milliseconds: 200), () {
    Get.snackbar(
      "Error",
      errorMessage ?? "",
      backgroundColor: AppColors.error,
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 3),
      messageText: Text(
        errorMessage ?? "An error occurred",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  });
}
