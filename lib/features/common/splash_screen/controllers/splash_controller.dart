import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/routes/app_routes.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() async {
    await AuthService.init();

    Future.delayed(
      const Duration(milliseconds: 1800),
      () {
        bool hasToken = AuthService.hasToken();
        if (hasToken) {
          final role = AuthService.role;
          switch (role) {
            case 'SUPERADMIN':
              return Get.offAllNamed(AppRoute.superLandingScreen);
            case "USER":
              return Get.offAllNamed(AppRoute.landingPage);
            case "SUPERVISER":
              return Get.offAllNamed(AppRoute.supervisorLandingScreen);
          }
        } else {
          Get.offAllNamed(AppRoute.loginScreen);
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHomeScreen();
  }
}
