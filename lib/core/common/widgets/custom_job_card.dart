import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: CustomText(
                    text: title,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F2326),
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0D9EB5),
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
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(onTap: onStartJob, title: "Start Job"),
                ),
              ],
            ),
          ],
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
