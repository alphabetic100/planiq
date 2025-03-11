import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

successSnakbr({String? successMessage}) {
  return Future.delayed(Duration(milliseconds: 200), () {
    Get.snackbar(
      "Success",
      successMessage ?? "",
      backgroundColor: AppColors.green,
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 3),
      messageText: Text(
        successMessage ?? "Operation Successful",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  });
}
