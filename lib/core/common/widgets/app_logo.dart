import 'package:flutter/material.dart';
import 'package:planiq/core/utils/constants/image_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.appLogo,
      height: height,
      width: width,
    );
  }
}
