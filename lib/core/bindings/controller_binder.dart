import 'package:get/get.dart';
import 'package:planiq/features/common/splash_screen/controllers/splash_controller.dart';
import 'package:planiq/features/employe_flow/landing/controller/landing_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
      fenix: true,
    );

    Get.lazyPut<LandingController>(
      () => LandingController(),
      fenix: true,
    );
  }
}
