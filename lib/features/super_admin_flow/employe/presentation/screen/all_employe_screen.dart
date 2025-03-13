import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/employee_list_screen_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/add_new_employee_screen.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/employee_card.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/employee_search_bar.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/search_button.dart';

class AllEmployeListScreen extends StatelessWidget {
  AllEmployeListScreen({super.key});
  final EmployeeListScreenController employeeController =
      Get.put(EmployeeListScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Employee",
        backButton: false,
      ),
      body: BodyPadding(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  employeeController.isExpanded.value
                      ? SizedBox.shrink()
                      : Spacer(),
                  employeeController.isExpanded.value
                      ? Expanded(
                          child: EmployeeSearchBar(
                          controller: employeeController,
                        ))
                      : SearchButton(
                          onTap: () => employeeController.toggleExpanded(),
                        ),
                  if (!employeeController.isExpanded.value) ...[
                    HorizontalSpace(width: 12),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AddNewEmployeeScreen());
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
                              text: "Add New Employee",
                              color: AppColors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
                ],
              ),
              if (!employeeController.isExpanded.value) ...[
                VerticalSpace(height: 10),
                CustomText(
                  text: "Short By: A -Z",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textSecondary,
                ),
                VerticalSpace(height: 10),
                Expanded(child: Obx(() {
                  if (employeeController.employes.value == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (employeeController
                      .employes.value!.data.data.isEmpty) {
                    return Center(
                      child: CustomText(text: "No employe list"),
                    );
                  } else {
                    return RefreshIndicator(
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.secondaryColor,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            employeeController.employes.value!.data.data.length,
                        itemBuilder: (context, index) {
                          final employe = employeeController
                              .employes.value!.data.data[index];
                          log(employe.toString());
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: EmployeeCard(
                              profileImage: employe.profileImage,
                              id: employe.id,
                              name: employe.name,
                              employeID: employe.personId,
                              role: employe.role,

                            ),
                          );
                        },
                      ),
                      onRefresh: () => employeeController.getAllEmployes(),
                    );
                  }
                })),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
