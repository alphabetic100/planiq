import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/assign_task/controller/assign_task_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/employee_card.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/search_button.dart';

class AssignTaskScreen extends StatelessWidget {
  AssignTaskScreen({super.key, required this.jobID});
  final String jobID;
  final AssignTaskController assignTaskController =
      Get.put(AssignTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Assign Task",
        backButton: true,
      ),
      body: BodyPadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VerticalSpace(height: 20),
          CustomTextField(
            onChange: (value) {
              assignTaskController.searchEmployees(value);
            },
            hintText: "Enter User ID or Name",
            suffixIcon: SearchButton(
              onTap: () {
                assignTaskController.searchEmployees(
                    assignTaskController.searchController.text);
              },
              backGroundColor: AppColors.primaryColor,
              iconColor: AppColors.white,
            ),
          ),
          VerticalSpace(height: 10),
          VerticalSpace(height: 10),
          Expanded(child: Obx(() {
            if (assignTaskController.employes.value == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (assignTaskController.filteredEmployees.isEmpty) {
              return Center(
                child: CustomText(text: "No employee found"),
              );
            } else {
              return RefreshIndicator(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.secondaryColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: assignTaskController.filteredEmployees.length,
                  itemBuilder: (context, index) {
                    final employee =
                        assignTaskController.filteredEmployees[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: EmployeeCard(
                        isFromassign: true,
                        taskID: jobID,
                        profileImage: employee.profileImage,
                        id: employee.id,
                        name: employee.name,
                        employeID: employee.personId,
                        role: employee.role,
                      ),
                    );
                  },
                ),
                onRefresh: () => assignTaskController.getAllEmployes(),
              );
            }
          })),
        ]),
      ),
    );
  }
}
