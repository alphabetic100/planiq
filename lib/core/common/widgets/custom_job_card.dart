import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/screens/job_details_screen.dart';

class CustomJobCard extends StatelessWidget {
  final String title;
  final String status;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final DateTime dateTime;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final VoidCallback onViewDetails;
  final VoidCallback onStartJob;
  final bool isFromAdmin;
  final bool isSupervisor;

  const CustomJobCard({
    super.key,
    required this.title,
    required this.status,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.dateTime,
    required this.startTime,
    required this.endTime,
    required this.onViewDetails,
    required this.onStartJob,
    this.isFromAdmin = false,
    this.isSupervisor = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobDetailsScreen(
              isFromAdmin: isFromAdmin,
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
                        color: (!isFromAdmin && status == "Compleated")
                            ? AppColors.primaryColor
                            : statusColor(status).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: CustomText(
                          text: status,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: (!isFromAdmin && status == "Compleated")
                              ? AppColors.white
                              : statusColor(status),
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
                  Icon(
                    Icons.location_on_outlined,
                    size: 23.h,
                    color: Color(0xFF757575),
                  ),
                  SizedBox(width: 8.sp),
                  Expanded(
                    child: CustomText(
                      text: '$address, $city, $state $zipCode',
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
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: Color(0xFF757575),
                  ),
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
                  Icon(
                    Icons.access_time,
                    size: 20.h,
                    color: Color(0xFF757575),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${_formatTimeOfDay(startTime)} - ${_formatTimeOfDay(endTime)}',
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
                    onTap: onViewDetails,
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

  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
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
    case "Compleated":
      return Color(0xFF00238A);
    case "Unassigned":
      return Color(0xFF8A0000);
    default:
      return Color(0xFF0D9EB5);
  }
}
