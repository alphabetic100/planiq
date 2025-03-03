import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class CompleatedJobScreen extends StatelessWidget {
  const CompleatedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return BodyPadding(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20.h,
              ),
              child: CustomJobCard(
                title: 'Emergency Pipe Repair',
                status: "Compleated",
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
            ),
          );
        });
  }
}
