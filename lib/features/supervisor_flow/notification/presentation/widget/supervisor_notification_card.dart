
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/supervisor_flow/notification/model/supervisor_notification_model.dart';

class SupervisorNotificationCard extends StatelessWidget {
  final String taskId;
  final DateTime date;
  final bool isAccepted;
  final VoidCallback? onTap;
  final String title;
  final String body;
  final Job job;

  const SupervisorNotificationCard({
    super.key,
    required this.taskId,
    required this.date,
    required this.isAccepted,
    this.onTap,
    required this.title,
    required this.body,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
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
                            title,
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
                      CustomText(
                        text: body,
                        fontSize: 16.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ],
            ),
            VerticalSpace(height: 20.h),
            if (job.status.isNotEmpty) ...[
              CustomJobCard(
                id: taskId,
                title: job.title,
                isSupervisor: true,
                status: job.status,
                address: job.location,
                dateTime: DateTime(2025, 1, 22),
                time: job.time,
                onViewDetails: () {},
                onStartJob: () {},
              ),
            ]
          ],
        ),
      ),
    );
  }
}
