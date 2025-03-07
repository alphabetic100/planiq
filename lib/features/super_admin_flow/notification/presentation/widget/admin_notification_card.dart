import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class AdminNotificationCard extends StatelessWidget {
  final String taskId;
  final String userId;
  final DateTime date;
  final bool isAccepted;
  final VoidCallback? onTap;

  const AdminNotificationCard({
    super.key,
    required this.taskId,
    required this.userId,
    required this.date,
    required this.isAccepted,
    this.onTap,
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
                      Text(
                        'Task assignment accepted',
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
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
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        color: Color(0xFF526366),
                      ),
                      children: [
                        const TextSpan(text: 'Task #'),
                        TextSpan(text: taskId),
                        const TextSpan(text: ' has been accepted by User ID: '),
                        TextSpan(text: userId),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
