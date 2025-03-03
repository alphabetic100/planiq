import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

import 'package:planiq/features/employe_flow/home/presentation/components/home_profile_card.dart';
import 'package:planiq/features/employe_flow/home/presentation/components/task_overview_section.dart';
import 'package:planiq/features/employe_flow/home/presentation/components/todays_schedule_section.dart';

class EmployeHomeScreen extends StatelessWidget {
  const EmployeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HomeProfileCard(),
        VerticalSpace(height: 30),
        Expanded(
          child: BodyPadding(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomJobCard(
                  title: 'Emergency Pipe Repair',
                  status: 'Starting soon',
                  address: '9641 Sunset Blvd',
                  city: 'Beverly Hills',
                  state: 'California',
                  zipCode: '90210',
                  dateTime: DateTime(2025, 1, 22),
                  startTime: const TimeOfDay(hour: 10, minute: 0),
                  endTime: const TimeOfDay(hour: 12, minute: 30),
                  onViewDetails: () {},
                  onStartJob: () {},
                ),
                VerticalSpace(height: 30.h),
                TaskOverviewSection(),
                VerticalSpace(height: 30.h),
                TodaysScheduleSection()
              ],
            ),
          )),
        ),
      ],
    ));
  }
}
