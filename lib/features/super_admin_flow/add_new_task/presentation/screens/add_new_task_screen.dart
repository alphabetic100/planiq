import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/controller/new_task_controller.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/widgets/task_contact_detail.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/widgets/task_detail_fields.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/widgets/task_extra_details.dart';

class AddNewTaskScreen extends StatelessWidget {
  AddNewTaskScreen({super.key});
  final NewTaskController taskController = Get.find<NewTaskController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Add New Task",
        backButton: true,
      ),
      body: SingleChildScrollView(
        child: BodyPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Obx(
                () => taskController.images.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: taskController.images.length < 6
                            ? taskController.images.length + 1
                            : 6,
                        itemBuilder: (context, index) {
                          if (index < taskController.images.length) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    taskController.images[index],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () =>
                                        taskController.removeImage(index),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        padding: EdgeInsets.all(4),
                                        child:
                                            Image.asset(IconPath.deleteIcon)),
                                  ),
                                )
                              ],
                            );
                          } else if (taskController.images.isNotEmpty) {
                            return GestureDetector(
                              onTap: () {
                                taskController.pickImages();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.secondaryColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 30,
                                      color: AppColors.primaryColor,
                                    ),
                                    SizedBox(height: 5),
                                    Text("Add Photo",
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        )),
                                    Text(
                                        "${taskController.images.length}/6 Photos",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                              ),
                            );
                          }
                          return null;
                        },
                      )
                    : SizedBox.shrink(),
              ),
              Obx(() => taskController.images.isEmpty
                  ? Column(
                      children: [
                        VerticalSpace(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                  AppColors.primaryColor.withOpacity(0.1)),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          onPressed: taskController.pickImages,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                color: AppColors.primaryColor,
                              ),
                              HorizontalSpace(width: 10),
                              CustomText(
                                text: "Select Photo",
                                color: AppColors.primaryColor,
                              )
                            ],
                          ),
                        ),
                        VerticalSpace(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: CustomText(
                            text: "Add Up to 6 Photos",
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink()),
              Form(
                  key: taskController.formstate,
                  child: Column(
                    children: [
                      VerticalSpace(height: 24.h),
                      TaskDetailFields(),
                      VerticalSpace(height: 24.h),
                      TaskExtraDetails(),
                      VerticalSpace(height: 24.h),
                      TaskContactDetail(),
                      VerticalSpace(height: 50.h),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
