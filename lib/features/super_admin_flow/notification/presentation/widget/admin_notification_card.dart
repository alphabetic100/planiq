import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class AdminNotificationCard extends StatelessWidget {
  final DateTime date;
  final bool isAccepted;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  const AdminNotificationCard({
    super.key,
    required this.subtitle,
    required this.date,
    required this.isAccepted,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35.0.w,
              height: 35.0.h,
              decoration: BoxDecoration(
                color: isAccepted ? Color(0xFFF1FFF5) : Color(0xFFFFF1F1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.notifications_active,
                  color: isAccepted ? Color(0xFF22C55E) : Color(0xFFA31616),
                  size: 20.0,
                ),
              ),
            ),
            SizedBox(width: 16.0.w),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('MMM d, yyyy').format(date),
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          color: Color(0xFF64748B), // Slate gray color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  CustomText(
                    text: subtitle,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textSecondary,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
