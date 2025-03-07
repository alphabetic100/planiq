import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class TaskContactDetail extends StatelessWidget {
  const TaskContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Add Contact Details",
          fontSize: 20.sp,
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Customer Details",
          fontSize: 16,
        ),
        VerticalSpace(height: 12),
        CustomText(
          text: "Customer Name",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        VerticalSpace(height: 8),
        CustomTextField(),
        VerticalSpace(height: 12),
        CustomText(
          text: "Customer Number",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        CustomTextField(
          prefixIcon: Icon(
            Icons.call,
            color: Color(0xFF526366),
          ),
        ),
      ],
    );
  }
}
