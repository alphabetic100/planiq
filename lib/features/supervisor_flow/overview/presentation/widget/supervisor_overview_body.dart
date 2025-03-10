import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class SupervisorOverviewBody extends StatelessWidget {
  SupervisorOverviewBody({super.key});
  final List<Map<String, String>> overviews = [
    {
      "title": "Total Assigned Task   ",
      "value": "1,254",
    },
    {
      "title": "Schedule Task",
      "value": "852",
    },
    {
      "title": "Work In Progress\n(WIP)",
      "value": "487",
    },
    {
      "title": "Completed Task",
      "value": "524",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: getSOverviewColors(index).withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: overviews[index]["title"]!,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: getSOverviewColors(index),
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpace(height: 10.h),
                    CustomText(
                      text: overviews[index]["value"]!,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: getSOverviewColors(index),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

Color getSOverviewColors(int index) {
  if (index == 0) {
    return Color(0xFF00768A);
  } else if (index == 1) {
    return Color(0xFF6E008A);
  } else if (index == 2) {
    return Color(0xFF16A34A);
  } else {
    return Color(0xFF00278A);
  }
}
