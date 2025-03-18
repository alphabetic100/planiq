import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/employee_list_screen_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/search_button.dart';

class EmployeeSearchBar extends StatelessWidget {
  const EmployeeSearchBar({super.key, required this.controller});
  final EmployeeListScreenController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller.searchController,
      hintText: "Enter User ID or Name",
      suffixIcon: SearchButton(
        onTap: () {
          controller.toggleExpanded();
        },
        backGroundColor: AppColors.primaryColor,
        iconColor: AppColors.white,
      ),
      onChange: (value) => controller.searchEmployees(value),
    );
  }
}
