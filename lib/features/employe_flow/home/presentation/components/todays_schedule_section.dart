import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class TodaysScheduleSection extends StatelessWidget {
  const TodaysScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Today’s Schedule",
          color: Color(0xFf0F2326),
          fontSize: 20.sp,
        ),
        //    VerticalSpace(height: 20.h),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: CustomJobCard(
                  title: 'Emergency Pipe Repair',
                  status: 'Scheduled',
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
            })
      ],
    );
  }
}
