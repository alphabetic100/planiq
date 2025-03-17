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
    required this.profileImage,
    required this.name,
    required this.employeID,
    required this.role,
    required this.id,
    this.isFromassign = false,
    this.taskID = "",
  });
  final bool isBlocklist;
  final String profileImage;
  final String name;
  final String employeID;
  final String role;
  final String id;
  final bool isFromassign;
  final String taskID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 30.w,
            backgroundImage: profileImage.isNotEmpty
                ? NetworkImage(profileImage)
                : AssetImage(
                    IconPath.profileIcon,
                  ),
            backgroundColor: Colors.grey.shade200,
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: role.isNotEmpty ? " (${role.toLowerCase()})" : "",
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: CustomText(
                  text: "Employee ID: $employeID",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textSecondary,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () {
                  isBlocklist
                      ? null
                      : Get.to(() => EmployeProfileDetailsScreen(
                            employeeID: id,
                            isFromBooking: isFromassign,
                            taskID: taskID,
                          ));
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
