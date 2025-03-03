import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/landing/controllers/super_landing_controller.dart';

class SuperNavBar extends StatelessWidget {
  SuperNavBar({super.key});
  final List<String> labels = const [
    'Overview',
    'Notification',
    'Jobs',
    'Profile',
  ];
  final List<Image> activeIcons = [
    Image.asset(
      IconPath.overviewIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: AppColors.primaryColor,
    ),
    Image.asset(
      IconPath.notificationIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: AppColors.primaryColor,
    ),
    Image.asset(
      IconPath.jobsIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: AppColors.primaryColor,
    ),
    Image.asset(
      IconPath.usersIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: AppColors.primaryColor,
    ),
  ];

  final List<Image> inActiveIcons = [
    Image.asset(
      IconPath.overviewIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: Color(0xFF808080),
    ),
    Image.asset(
      IconPath.notificationIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: Color(0xFF808080),
    ),
    Image.asset(
      IconPath.jobsIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: Color(0xFF808080),
    ),
    Image.asset(
      IconPath.usersIcon,
      height: (30),
      width: (30),
      fit: BoxFit.cover,
      color: Color(0xFF808080),
    ),
  ];
  final SuperLandingController controller = Get.find<SuperLandingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        selectedLabelStyle:
            TextStyle(fontSize: (14.sp), fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: (13.sp),
          color: AppColors.textPrimary,
          fontFamily: GoogleFonts.figtree().fontFamily,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: AppColors.white,
        currentIndex: controller.currentPage.value,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Color(0xFF808080),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => controller.changePage(value),
        items: List.generate(
          labels.length,
          (index) {
            //   final isSelected = controller.currentPage.value == index;
            return BottomNavigationBarItem(
              icon: controller.currentPage.value == index
                  ? activeIcons[index]
                  : inActiveIcons[index],
              label: labels[index],
            );
          },
        ),
      ),
    );
  }
}
