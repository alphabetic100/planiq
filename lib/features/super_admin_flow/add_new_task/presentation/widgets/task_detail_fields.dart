import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_calendar_widget.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/common/widgets/custom_time_picker.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/core/utils/validators/app_validator.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/controller/new_task_controller.dart';

class TaskDetailFields extends StatelessWidget {
  TaskDetailFields({super.key});
  final NewTaskController taskController = Get.find<NewTaskController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Job Title",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          controller: TextEditingController()
            ..text = taskController.title.value,
          onChange: (value) {
            taskController.title.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Job Location",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          prefixIcon: Image.asset(IconPath.locationIcon),
          controller: TextEditingController()
            ..text = taskController.location.value,
          onChange: (value) {
            taskController.location.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Job Date",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        Obx(
          () => CustomTextField(
            readOnly: true,
            prefixIcon: Image.asset(IconPath.calendarIcon),
            controller: TextEditingController()
              ..text = taskController.date.value.isNotEmpty
                  ? AppHelperFunctions.formatDate(taskController.date.value)
                  : "",
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: CustomCalendarWidget(
                        onDaySelected: (date) {
                          taskController.date.value = date.toString();
                          log(date.toString());
                        },
                      ),
                    );
                  });
            },
            validator: AppValidator.validateField,
          ),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Job Time",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        Obx(
          () => CustomTextField(
            readOnly: true,
            prefixIcon: Image.asset(IconPath.timerIcon),
            controller: TextEditingController()
              ..text = taskController.time.value,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return TimeRangePickerDialog(
                      onTimeSelected: (String timeRange) {
                        taskController.time.value = timeRange;
                      },
                    );
                  });
            },
            validator: AppValidator.validateField,
          ),
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Location Map Link",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          prefixIcon: Image.asset(IconPath.locationIcon),
          controller: TextEditingController()
            ..text = taskController.mapLink.value,
          onChange: (value) {
            taskController.mapLink.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Description",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          maxLines: 4,
          controller: TextEditingController()
            ..text = taskController.description.value,
          onChange: (value) {
            taskController.description.value = value;
          },
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Payment Rate (Starting)",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          numberOnly: true,
          keyboardType: TextInputType.number,
          prefixIcon: Icon(
            Icons.euro,
            color: AppColors.primaryColor,
          ),
          controller: TextEditingController()
            ..text = taskController.paymentRate.value,
          onChange: (value) {
            taskController.paymentRate.value = value;
          },
          validator: AppValidator.validateField,
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Estimated Duration",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          controller: TextEditingController()
            ..text = taskController.duration.value,
          onChange: (value) {
            taskController.duration.value = value;
          },
        ),
        VerticalSpace(height: 16),
        CustomText(
          text: "Admin Notes",
          color: AppColors.textSecondary,
        ),
        VerticalSpace(height: 8),
        CustomTextField(
          maxLines: 4,
          controller: TextEditingController()
            ..text = taskController.adminNote.value,
          onChange: (value) {
            taskController.adminNote.value = value;
          },
          validator: AppValidator.validateField,
          onSubmit: (value) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
