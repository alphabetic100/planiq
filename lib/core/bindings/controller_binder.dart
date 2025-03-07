import 'package:get/get.dart';
import 'package:planiq/features/common/splash_screen/controllers/splash_controller.dart';
import 'package:planiq/features/employe_flow/landing/controller/landing_controller.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/controller/new_task_controller.dart';
import 'package:planiq/features/super_admin_flow/landing/controllers/super_landing_controller.dart';

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

    Get.lazyPut<SuperLandingController>(
      () => SuperLandingController(),
      fenix: true,
    );

    Get.lazyPut<NewTaskController>(
      () => NewTaskController(),
      fenix: true,
    );
  }
}
