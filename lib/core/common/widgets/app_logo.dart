import 'package:flutter/material.dart';
import 'package:planiq/core/utils/constants/image_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height,
    this.width,
    this.color,
  });
  final double? height;
  final double? width;

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.appLogo,
      height: height,
      width: width,
      color: color,
    );
  }
}
