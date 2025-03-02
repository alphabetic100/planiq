import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/features/authentication/presentation/screens/login_screen.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offAll(
          () => const LoginScreen(),
          // transition: Transition.fade,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHomeScreen();
  }
}
