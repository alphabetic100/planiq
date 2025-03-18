import 'package:get/get.dart';
import 'package:planiq/features/common/authentication/presentation/screens/login_screen.dart';
import 'package:planiq/features/common/splash_screen/presentation/screens/splash_screen.dart';
import 'package:planiq/features/employe_flow/landing/presentation/screens/landing_screen.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/all_employe_screen.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/screens/admin_jobs_screen.dart';
import 'package:planiq/features/super_admin_flow/landing/screens/super_admin_landing_screen.dart';
import 'package:planiq/features/super_admin_flow/notification/presentation/screens/admin_notification_screen.dart';
import 'package:planiq/features/supervisor_flow/landing/presentation/screens/supervisor_landing_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String init = "/";
  static String superLandingScreen = "/superLandingScreen";
  static String adminNotificationScreen = "/adminNotificationScreen";
  static String adminJobScreen = "/adminJobScreen";
  static String adminEmplyeeScreen = "/adminEmplyeeScreen";

  //Employe routes
  static String landingPage = "/landingPage";

  //Supervisor route
  static String supervisorLandingScreen = "/supervisorLandingScreen";

  static List<GetPage> routes = [
    GetPage(name: init, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),

    //Employe Routes
    GetPage(name: landingPage, page: () => EmployeLandingScreen()),

    //Super Admin
    GetPage(name: superLandingScreen, page: () => SuperAdminLandingScreen()),
    GetPage(
        name: adminNotificationScreen, page: () => AdminNotificationScreen()),
    GetPage(name: adminJobScreen, page: () => AdminJobsScreen()),
    GetPage(name: adminEmplyeeScreen, page: () => AllEmployeListScreen()),

    //supervisor routes
    GetPage(
        name: supervisorLandingScreen, page: () => SupervisorLandingScreen()),
  ];
}
