import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/features/employe_flow/home/presentation/screens/employe_home_screen.dart';
import 'package:planiq/features/employe_flow/jobs/presentation/screens/employe_jobs_screen.dart';
import 'package:planiq/features/employe_flow/landing/controller/landing_controller.dart';
import 'package:planiq/features/employe_flow/landing/presentation/components/custom_bottom_nav_bar.dart';
import 'package:planiq/features/employe_flow/notification/presentation/screens/employe_notification_screen.dart';
import 'package:planiq/features/employe_flow/profile/presentation/screens/employe_profile_screen.dart';

class EmployeLandingScreen extends StatelessWidget {
  EmployeLandingScreen({super.key});
  final LandingController landingController = Get.find<LandingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) => landingController.currentPage.value = value,
        controller: landingController.pageController,
        children: [
          EmployeHomeScreen(),
          EmployeNotificationScreen(),
          EmployeJobsScreen(),
          EmployeProfileScreen(),
        ],
      ),
    );
  }
}
