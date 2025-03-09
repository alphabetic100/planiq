import 'package:flutter/material.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
      {super.key, this.onTap, this.iconColor, this.backGroundColor});
  final Function()? onTap;
  final Color? backGroundColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backGroundColor,
            border: Border.all(
              color: AppColors.primaryColor,
            )),
        child: Icon(
          Icons.search,
          color: iconColor ?? AppColors.primaryColor,
        ),
      ),
    );
  }
}
