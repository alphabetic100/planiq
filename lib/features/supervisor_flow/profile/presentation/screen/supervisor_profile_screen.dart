import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/show_logout_dialog.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/values/profile_values.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/change_password_screen.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/language_optins_screen.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/profile_details_screen.dart';
import 'package:planiq/features/employe_flow/profile/presentation/components/profile_option_card.dart';

class SupervisorProfileScreen extends StatelessWidget {
  const SupervisorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Profile",
      ),
      body: Column(
        children: [
          VerticalSpace(height: 20.h),
          ListTile(
            onTap: () {
              Get.to(() => ProfileDetailsScreen());
            },
            leading: Obx(
              () => CircleAvatar(
                radius: 35.w,
                backgroundColor: AppColors.secondaryColor,
                backgroundImage: ProfileValues.profileImage.value.isNotEmpty
                    ? NetworkImage(ProfileValues.profileImage.value)
                    : AssetImage(IconPath.profileIcon),
              ),
            ),
            title: CustomText(
              text: ProfileValues.name.value,
              fontSize: 18.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            subtitle: CustomText(
              text: "User ID: ${ProfileValues.personID.value}",
              color: Color(0xFF526366),
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF526366),
              ),
            ),
          ),
          Divider(
            thickness: 3,
            color: Color(0xFFF5F5F5),
          ),
          ProfileOptionCard(
            onTap: () => Get.to(() => LanguageSelectionScreen()),
            leading: Icon(
              Icons.language,
              color: Color(0xFF526366),
            ),
            title: "Language",
          ),
          Divider(
            color: Color(0xFFF5F5F5),
          ),
          ProfileOptionCard(
            onTap: () => Get.to(() => ChangePasswordScreen()),
            leading: Icon(
              Icons.lock_outline,
              color: Color(0xFF526366),
            ),
            title: "Change Password",
          ),
          Divider(
            color: Color(0xFFF5F5F5),
          ),
          ProfileOptionCard(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ShowLogoutDialog();
                  });
            },
            leading: Icon(
              Icons.logout,
              color: AppColors.error,
            ),
            title: "Logout",
            color: AppColors.error,
          ),
        ],
      ),
    );
  }
}
