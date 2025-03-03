import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.centerTitle,
    this.actions,
    this.ontapBackButton,
    this.backButton = false,
    this.backgroundColor,
    this.appbarHeight = kToolbarHeight,
  });
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final VoidCallback? ontapBackButton;
  final bool backButton;
  final Color? backgroundColor;
  final double appbarHeight;
  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      forceMaterialTransparency: false,
      surfaceTintColor: AppColors.primaryColor,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      title: title.isNotEmpty
          ? CustomText(
              text: title,
              fontSize: (20.sp),
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            )
          : null,
      centerTitle: centerTitle,
      actions: actions,
      leading: backButton
          ? GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
              ),
            )
          : null,
    );
  }
}
