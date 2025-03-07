import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/widgets/task_contact_detail.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/widgets/task_detail_fields.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/widgets/task_extra_details.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

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
              VerticalSpace(height: 20),
              CustomText(
                text: "Job ID: #52484",
                color: AppColors.textSecondary,
              ),
              VerticalSpace(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                        AppColors.primaryColor.withOpacity(0.1)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                onPressed: () {},
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
              VerticalSpace(height: 24.h),
              TaskDetailFields(),
              VerticalSpace(height: 24.h),
              TaskExtraDetails(),
              VerticalSpace(height: 24.h),
              TaskContactDetail(),
              VerticalSpace(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
