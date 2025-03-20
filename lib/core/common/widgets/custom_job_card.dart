import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/screens/job_details_screen.dart';
import 'package:planiq/features/employe_flow/notification/presentation/components/notification_card.dart';

class CustomJobCard extends StatelessWidget {
  final String title;
  final String status;
  final String address;
  final String? city;
  final String? state;
  final String? zipCode;
  final DateTime dateTime;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final VoidCallback onViewDetails;
  final VoidCallback onStartJob;
  final bool isFromAdmin;
  final bool isSupervisor;
  final String? time;
  final String id;
  const CustomJobCard({
    super.key,
    required this.title,
    required this.status,
    required this.address,
    this.city,
    this.state,
    this.zipCode,
    required this.dateTime,
    this.startTime,
    this.endTime,
    this.time,
    required this.onViewDetails,
    required this.onStartJob,
    this.isFromAdmin = false,
    this.isSupervisor = false,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobDetailsScreen(
              isFromAdmin: isFromAdmin,
              jobId: id,
              status: status,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFAFEFF),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0x7A959926).withOpacity(0.15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: CustomText(
                      text: title,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2326),
                    ),
                  ),
                  HorizontalSpace(width: 5.w),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: (!isFromAdmin && status == "COMPLETED")
                            ? AppColors.primaryColor
                            : statusColor(isFromAdmin
                                    ? status
                                    : decodeEmployeStatus(status))
                                .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: CustomText(
                          text: isFromAdmin
                              ? status
                              : decodeEmployeStatus(status),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: (!isFromAdmin && status == "COMPLETED")
                              ? AppColors.white
                              : statusColor(isFromAdmin
                                  ? status
                                  : decodeEmployeStatus(status)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Address
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(IconPath.locationOutlined),
                  SizedBox(width: 8.sp),
                  Expanded(
                    child: CustomText(
                      text: address,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Date
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(IconPath.calenderOutlined),
                  const SizedBox(width: 8),
                  CustomText(
                    text:
                        '${_getDayOfWeek(dateTime)} - ${DateFormat('dd/MM/yyyy').format(dateTime)}',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF757575),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Time
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(IconPath.timerOutlined),
                  const SizedBox(width: 8),
                  Text(
                    time ?? "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    isPrimary: false,
                    onTap: () {
                      Get.to(() => JobDetailsScreen(
                            isFromAdmin: isFromAdmin,
                            jobId: id,
                            status: status,
                          ));
                    },
                    title: "View Details",
                    titleColor: AppColors.primaryColor,
                  )),
                  if (!isSupervisor && status == "Starting soon") ...[
                    const SizedBox(width: 8),
                    Expanded(
                      child:
                          CustomButton(onTap: onStartJob, title: "Start Job"),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDayOfWeek(DateTime dateTime) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[dateTime.weekday - 1];
  }
}

Color statusColor(String status) {
  switch (status) {
    case "Starting soon":
    case "Scheduled":
      return Color(0xFF0D9EB5);
    // case "Compleated":
    //   return AppColors.white;
    case "Work In Progress":
    case "Assigned":
      return Color(0xFF16A34A);
    case "New Assignment":
    case "Completed":
      return Color(0xFF00238A);
    case "Unassigned":
    case "Declined":
      return Color(0xFF8A0000);
    default:
      return Color(0xFF0D9EB5);
  }
}
