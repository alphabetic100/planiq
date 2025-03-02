import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/features/splash_screen/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
