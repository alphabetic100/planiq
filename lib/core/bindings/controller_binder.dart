import 'package:get/get.dart';
import 'package:planiq/features/splash_screen/controllers/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
      fenix: true,
    );
  }
}
