import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class AllJobsList extends StatelessWidget {
  const AllJobsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(height: 20),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: CustomJobCard(
                    isFromAdmin: true,
                    title: 'Emergency Pipe Repair',
                    status: index % 3 == 1
                        ? "Scheduled"
                        : index % 2 == 0
                            ? 'Compleated'
                            : "Assigned",
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
                );
              }),
        )
      ],
    );
  }
}
