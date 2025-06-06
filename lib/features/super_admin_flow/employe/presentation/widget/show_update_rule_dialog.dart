import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/employee_profile_controller.dart';

class ShowUpdateRuleDialog extends StatelessWidget {
  ShowUpdateRuleDialog({
    super.key,
  });
  final EmployeeProfileController profileController =
      Get.find<EmployeeProfileController>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Are you sure you want to change this employee's role?",
                textAlign: TextAlign.center,
              ),
            ),
            VerticalSpace(height: 24.h),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  bordercolor: Color(0xff808080),
                  color: Color(0xff808080),
                  onTap: () {
                    Get.back();
                  },
                  title: "Cancel",
                )),
                HorizontalSpace(width: 16.w),
                Expanded(
                    child: CustomButton(
                  onTap: () {
                    Get.back();
                    profileController.makeSuperVisor(
                        profileController.employeeID.value,
                        profileController.employeeName.value);
                  },
                  title: "Proceed",
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
