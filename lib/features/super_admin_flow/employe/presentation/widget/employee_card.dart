import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/employe_profile_details_screen.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    this.isBlocklist = false,
  });
  final bool isBlocklist;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 30.w,
            backgroundImage: AssetImage(
              IconPath.profileIcon,
            ),
            backgroundColor: Colors.grey.shade200,
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "Aemon Targaryen",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: " (Manager Admin)",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ))
              ],
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Employee ID: 12548",
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.textSecondary,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => EmployeProfileDetailsScreen());
                },
                child: Text(
                  isBlocklist ? "Unblock" : "View Details",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Color(0xFFF1F2F6),
        )
      ],
    );
  }
}
