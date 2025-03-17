import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/home/model/employee_home_model.dart';

class TodaysScheduleSection extends StatelessWidget {
  const TodaysScheduleSection({super.key, required this.task});
  final TaskDetails task;
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
            itemCount: task.result.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final t = task.result[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: CustomJobCard(
                  id: t.job.id,
                  title: t.job.title,
                  status: t.job.status,
                  address: t.job.location,
                  dateTime: DateTime.parse(t.job.date),
                  time: t.job.time.toString(),
                  onViewDetails: () {},
                  onStartJob: () => {},
                ),
              );
            })
      ],
    );
  }
}
