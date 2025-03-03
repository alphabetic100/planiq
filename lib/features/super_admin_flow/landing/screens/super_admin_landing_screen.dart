import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/screens/admin_jobs_screen.dart';
import 'package:planiq/features/super_admin_flow/landing/components/super_nav_bar.dart';
import 'package:planiq/features/super_admin_flow/landing/controllers/super_landing_controller.dart';
import 'package:planiq/features/super_admin_flow/notification/presentation/screens/admin_notification_screen.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/screens/admin_overview_screen.dart';
import 'package:planiq/features/super_admin_flow/users/presentation/screens/admin_users_screen.dart';

class SuperAdminLandingScreen extends StatelessWidget {
  SuperAdminLandingScreen({super.key});
  final SuperLandingController superController =
      Get.find<SuperLandingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SuperNavBar(),
      body: PageView(
        onPageChanged: (value) => superController.currentPage.value = value,
        controller: superController.pageController,
        children: [
          AdminOverviewScreen(),
          AdminJobsScreen(),
          AdminUsersScreen(),
          AdminNotificationScreen(),
        ],
      ),
    );
  }
}
