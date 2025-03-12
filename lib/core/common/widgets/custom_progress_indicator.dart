import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

showProgressIndicator() {
  showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(25.h),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoActivityIndicator(color: Color(0xFFA8A5A5)),
                      SizedBox(height: 20.h),
                      CustomText(
                        text: "Loading",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

hideProgressIndicatro() {
  Get.back();
}
