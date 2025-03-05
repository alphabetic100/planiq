import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';

class AdminOverviewProfile extends StatelessWidget {
  const AdminOverviewProfile({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: SafeArea(
        child: Center(
          child: ListTile(
            leading: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset(IconPath.menueIcon)),
              ],
            ),
            title: Row(
              children: [
                CustomText(
                  text: "Welcome Back, David",
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                HorizontalSpace(width: 5.sp),
                CustomText(
                  text: "(Admin)",
                  color: AppColors.white.withOpacity(0.7),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            subtitle: CustomText(
              text: "Monday, January 17",
              color: AppColors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
