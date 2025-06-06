import 'package:flutter/material.dart';

//Horizontal Space bar
class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

//Vertical Space Space bar
class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
