import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/all_employe_screen.dart';

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
        VerticalSpace(height: 8),
        CustomTextField(
          prefixIcon: Image.asset(IconPath.phoneIcon),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Manager Details",
          fontSize: 16,
        ),
        VerticalSpace(height: 12),
        CustomText(
          text: "Manager Name",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        VerticalSpace(height: 8),
        CustomTextField(),
        VerticalSpace(height: 12),
        CustomText(
          text: "Manager Number",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          prefixIcon: Image.asset(IconPath.phoneIcon),
        ),
        VerticalSpace(height: 48.h),
        CustomButton(
            onTap: () {
              Get.to(() => AllEmployeListScreen());
            },
            title: "Add Task")
      ],
    );
  }
}
