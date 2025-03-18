import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/core/utils/values/profile_values.dart';

class AdminOverviewProfile extends StatelessWidget {
  const AdminOverviewProfile({
    super.key,
    required this.scaffoldKey,
    this.isfromAdmin = false,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isfromAdmin;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset(IconPath.menueIcon),
                  ),
                ],
              ),
              title: isfromAdmin
                  ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome Back, Devid",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // TextSpan(
                          //   text: ProfileValues.name.value,
                          //   style: TextStyle(
                          //     color: AppColors.white,
                          //     fontSize: 22.sp,
                          //     fontWeight: FontWeight.w700,
                          //   ),
                          // ),
                          TextSpan(
                            text: " (Admin)",
                            style: TextStyle(
                              color: AppColors.white.withOpacity(0.7),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Obx(
                      () => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome Back, ",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ProfileValues.name.value,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: " (Supervisor)",
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.7),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              subtitle: CustomText(
                text: AppHelperFunctions.getCurrentDateTime(),
                color: AppColors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
