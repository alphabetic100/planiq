import 'package:flutter/widgets.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/search_button.dart';
import 'package:planiq/features/super_admin_flow/jobs/controller/all_jobs_controller.dart';

class TaskSearchBar extends StatelessWidget {
  const TaskSearchBar({super.key, required this.controller, required this.onSearch});
  final AllJobsController controller;
  final Function(String value) onSearch;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller.searchController,
      onChange: onSearch,
      hintText: "Search Customer Name or Location",
      suffixIcon: SearchButton(
        onTap: () {
          controller.toggleExpanded();
        },
        backGroundColor: AppColors.primaryColor,
        iconColor: AppColors.white,
      ),
    );
  }
}
