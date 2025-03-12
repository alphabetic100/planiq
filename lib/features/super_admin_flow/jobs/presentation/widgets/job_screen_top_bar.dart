import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/features/super_admin_flow/add_new_task/presentation/screens/add_new_task_screen.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/search_button.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/all_jobs_controller.dart';
import 'package:planiq/features/super_admin_flow/jobs/presentation/widgets/task_search_bar.dart';

class JobScreenTopBar extends StatelessWidget {
  JobScreenTopBar({super.key, required this.onSearch});
  final Function(String value) onSearch;
  final AllJobsController jobsController = Get.put(AllJobsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          jobsController.isExpanded.value ? SizedBox.shrink() : Spacer(),
          jobsController.isExpanded.value
              ? Expanded(
                  child: TaskSearchBar(
                  controller: jobsController,
                ))
              : SearchButton(
                  onTap: () => jobsController.toggleExpanded(),
                ),
          if (!jobsController.isExpanded.value) ...[
            HorizontalSpace(width: 12),
            GestureDetector(
              onTap: () {
                Get.to(() => AddNewTaskScreen());
              },
              child: Container(
                height: 45,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                    HorizontalSpace(width: 8),
                    CustomText(
                      text: "Add New Task",
                      color: AppColors.white,
                    )
                  ],
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
