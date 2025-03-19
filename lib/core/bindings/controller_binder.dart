import 'package:get/get.dart';
import 'package:planiq/features/common/splash_screen/controllers/splash_controller.dart';
import 'package:planiq/features/employe_flow/home/controller/employee_home_controller.dart';
import 'package:planiq/features/employe_flow/jobs/controller/job_screen_controller.dart';
import 'package:planiq/features/employe_flow/landing/controller/landing_controller.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/controller/new_task_controller.dart';
import 'package:planiq/features/super_admin_flow/edit_task/controller/edit_task_controller.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/all_jobs_controller.dart';
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

    Get.lazyPut<AllJobsController>(
      () => AllJobsController(),
      fenix: true,
    );

    Get.lazyPut<EmployeeHomeController>(
      () => EmployeeHomeController(),
      fenix: true,
    );
    Get.lazyPut<JobScreenController>(
      () => JobScreenController(),
      fenix: true,
    );
        Get.lazyPut<EditTaskController>(
      () => EditTaskController(),
      fenix: true,
    );
  }
}
