import 'package:flutter/material.dart';

import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class ProfileOptionCard extends StatelessWidget {
  const ProfileOptionCard({
    super.key,
    required this.leading,
    required this.title,
    this.color,
    this.onTap,
  });
  final Widget leading;
  final String title;
  final Color? color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: CustomText(
        text: title,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: color ?? Color(0xFF526366),
      ),
    );
  }
}
