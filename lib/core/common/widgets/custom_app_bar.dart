import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.centerTitle,
    this.actions,
    this.ontapBackButton,
    this.backButton = true,
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
      forceMaterialTransparency: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor ?? Color(0xFFFAFAFC),
      title: title.isNotEmpty
          ? CustomText(
              text: title,
              fontSize: (18),
              color: AppColors.black,
            )
          : null,
      centerTitle: centerTitle,
      actions: actions,
      leading: backButton
          ? Padding(
              padding: EdgeInsets.only(
                left: (12),
              ),
              child: SizedBox(
                width: 50,
                height: 46,
                child: Align(
                  alignment: Alignment.center,
                  // child: CustomButton(
                  //   isPrimary: false,
                  //   height: 46,
                  //   width: 55,
                  //   onTap: ontapBackButton ?? () => Get.back(),
                  //   child: Icon(
                  //     CupertinoIcons.back,
                  //     color: AppColors.grey,
                  //     size: 28,
                  //   ),
                  // ),
                ),
              ),
            )
          : null,
    );
  }
}
