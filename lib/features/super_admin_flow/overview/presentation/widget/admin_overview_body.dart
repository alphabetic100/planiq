import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class AdminOverviewBody extends StatelessWidget {
  AdminOverviewBody({super.key});
  final List<Map<String, String>> overviews = [
    {
      "title": "Total Task",
      "value": "1,254",
    },
    {
      "title": "Assigned Task",
      "value": "852",
    },
    {
      "title": "Unassigned Task",
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
                  color: index == 0
                      ? Color(0xFFF2FDFF)
                      : index == 1
                          ? Color(0xFFF1FFF5)
                          : index == 2
                              ? Color(0xFFFFF2F2)
                              : Color(0xFFF2F6FF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: overviews[index]["title"]!,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: getOverviewColors(index),
                    ),
                    VerticalSpace(height: 10.h),
                    CustomText(
                      text: overviews[index]["value"]!,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: getOverviewColors(index),
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

Color getOverviewColors(int index) {
  if (index == 0) {
    return Color(0xFF00768A);
  } else if (index == 1) {
    return Color(0xFF16A34A);
  } else if (index == 2) {
    return Color(0xFF8A0000);
  } else {
    return Color(0xFF00298A);
  }
}
