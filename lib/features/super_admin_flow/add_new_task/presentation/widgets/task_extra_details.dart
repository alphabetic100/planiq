import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/controller/new_task_controller.dart';

class TaskExtraDetails extends StatelessWidget {
  TaskExtraDetails({super.key});
  final NewTaskController taskController = Get.find<NewTaskController>();
  final TextEditingController addChecklistCT = TextEditingController();
  final TextEditingController addToolsCT = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Progress Checklist",
          fontSize: 20.sp,
        ),
        VerticalSpace(height: 8),
        Obx(() {
          if (taskController.taskChecklist.isEmpty) {
            return SizedBox.shrink();
          } else {
            return Column(
              children: List.generate(
                taskController.taskChecklist.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Color(0xFF7A9599),
                                ),
                                HorizontalSpace(width: 20.w),
                                Expanded(
                                  child: CustomText(
                                    text: taskController.taskChecklist[index],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF7A9599),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                taskController.deleteChecklist(
                                    taskController.taskChecklist[index]);
                                addChecklistCT.clear();
                              },
                              icon: Icon(Icons.delete_forever))
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
        CustomButton(
          title: "",
          isPrimary: false,
          isChild: true,
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.white,
                    title: Center(
                      child: CustomText(text: "Add Checklist"),
                    ),
                    content: CustomTextField(
                      controller: addChecklistCT,
                    ),
                    actions: [
                      CustomButton(
                          onTap: () {
                            taskController.addChecklist(addChecklistCT.text);
                            addChecklistCT.clear();
                            Get.back();
                          },
                          title: "Add")
                    ],
                  );
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(width: 16),
              CustomText(
                text: "Add Checklist",
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
        VerticalSpace(height: 24),
        CustomText(
          text: "Required Tools",
          fontSize: 20.sp,
        ),
        VerticalSpace(height: 8),
        Obx(() {
          if (taskController.taskToolsList.isEmpty) {
            return SizedBox.shrink();
          } else {
            return Wrap(
              spacing: 8,
              runSpacing: 10,
              children: List.generate(
                taskController.taskToolsList.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      width: taskController.taskToolsList[index].length > 15
                          ? null
                          : 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFFEFF7F9),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HorizontalSpace(width: 20.w),
                          Expanded(
                            child: CustomText(
                              text: taskController.taskToolsList[index],
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF526366),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                taskController.deleteTools(
                                    taskController.taskToolsList[index]);
                              },
                              icon: Icon(Icons.delete_forever))
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
        CustomButton(
          title: "",
          isPrimary: false,
          isChild: true,
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.white,
                    title: Center(
                      child: CustomText(text: "Add Tools"),
                    ),
                    content: CustomTextField(
                      controller: addToolsCT,
                    ),
                    actions: [
                      CustomButton(
                          onTap: () {
                            taskController.addTools(addToolsCT.text);
                            addToolsCT.clear();
                            Get.back();
                          },
                          title: "Add")
                    ],
                  );
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(width: 16),
              CustomText(
                text: "Add Tools",
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
