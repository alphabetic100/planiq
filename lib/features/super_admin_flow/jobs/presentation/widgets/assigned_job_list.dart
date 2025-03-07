import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class AssignedJobList extends StatelessWidget {
  const AssignedJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  )),
              child: Icon(
                Icons.search,
                color: AppColors.primaryColor,
              ),
            ),
            HorizontalSpace(width: 12),
            Container(
              height: 45,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryColor,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                  HorizontalSpace(width: 8),
                  CustomText(
                    text: "Add New Task",
                    color: AppColors.white,
                  )
                ],
              ),
            ),
          ],
        ),
        VerticalSpace(height: 20),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: CustomJobCard(
                    isFromAdmin: true,
                    title: 'Emergency Pipe Repair',
                    status: "Assigned",
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
