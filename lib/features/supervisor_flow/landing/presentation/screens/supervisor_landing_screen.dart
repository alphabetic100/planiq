import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/features/supervisor_flow/jobs/presentation/screen/supervisor_job_screen.dart';
import 'package:planiq/features/supervisor_flow/landing/controller/supervisor_landing_controller.dart';
import 'package:planiq/features/supervisor_flow/landing/presentation/widget/supervisonr_nav_bar.dart';
import 'package:planiq/features/supervisor_flow/notification/presentation/screens/supervisor_notification_screen.dart';
import 'package:planiq/features/supervisor_flow/overview/presentation/screen/supervisor_overview_screen.dart';
import 'package:planiq/features/supervisor_flow/profile/presentation/screen/supervisor_profile_screen.dart';

class SupervisorLandingScreen extends StatelessWidget {
  SupervisorLandingScreen({super.key});
  final SupervisorLandingController landingController =
      Get.put(SupervisorLandingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SupervisonrNavBar(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) => landingController.currentPage.value = value,
        controller: landingController.pageController,
        children: [
          SupervisorOverviewScreen(),
          SupervisorNotificationScreen(),
          SupervisorJobsScreen(),
          SupervisorProfileScreen(),
        ],
      ),
    );
  }
}
