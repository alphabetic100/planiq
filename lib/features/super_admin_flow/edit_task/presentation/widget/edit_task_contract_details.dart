import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/validators/app_validator.dart';
import 'package:planiq/features/super_admin_flow/edit_task/controller/edit_task_controller.dart';

class EditTaskContactDetail extends StatelessWidget {
  EditTaskContactDetail({super.key, required this.taskId});
  final EditTaskController taskController = Get.find<EditTaskController>();
  final String taskId;
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
        CustomTextField(
          controller: TextEditingController()
            ..text = taskController.customerName.value,
          onChange: (value) {
            taskController.customerName.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 12),
        CustomText(
          text: "Customer Number",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          numberOnly: true,
          keyboardType: TextInputType.phone,
          prefixIcon: Image.asset(IconPath.phoneIcon),
          controller: TextEditingController()
            ..text = taskController.customerNumber.value,
          onChange: (value) {
            taskController.customerNumber.value = value;
          },
          validator: AppValidator.validateField,
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
        CustomTextField(
          controller: TextEditingController()
            ..text = taskController.managerName.value,
          onChange: (value) {
            taskController.managerName.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 12),
        CustomText(
          text: "Manager Number",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          numberOnly: true,
          keyboardType: TextInputType.phone,
          prefixIcon: Image.asset(IconPath.phoneIcon),
          controller: TextEditingController()
            ..text = taskController.managerNumber.value,
          onChange: (value) {
            taskController.managerNumber.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 48.h),
        CustomButton(
            onTap: () {
              if (taskController.taskChecklist.isEmpty) {
                errorSnakbar(errorMessage: "Progress checklist is required");
              }
              if (taskController.formstate.currentState!.validate() &&
                  taskController.taskChecklist.isNotEmpty) {
                taskController.updateTask(taskId);
              } else {
                errorSnakbar(
                    errorMessage: "Please fill all the required fields");
              }
              // Get.to(() => AllEmployeListScreen());
            },
            title: "Save Changes")
      ],
    );
  }
}
