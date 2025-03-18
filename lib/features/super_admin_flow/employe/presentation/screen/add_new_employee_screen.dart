import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_calendar_widget.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/core/utils/validators/app_validator.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/add_new_employe_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/labeled_text_field.dart';

class AddNewEmployeeScreen extends StatelessWidget {
  AddNewEmployeeScreen({super.key});

  final AddNewEmployeeController controller =
      Get.put(AddNewEmployeeController());
  final TextEditingController specializationCT = TextEditingController();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: 'Add New Employee',
        backButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture Section
                Center(
                  child: Stack(
                    children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 65,
                          backgroundColor: AppColors.secondaryColor,
                          backgroundImage: controller
                                  .employeeImage.value.isNotEmpty
                              ? FileImage(File(controller.employeeImage.value))
                              : AssetImage(IconPath.profileIcon),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            await controller.selectProfileImage();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFF0071C2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Personal Details Section
                Text(
                  'Personal Details :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16),

                // Name field
                LabeledTextField(
                  label: 'Name :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.name.value = value,
                  validator: AppValidator.validateField,
                ),

                // User ID field
                LabeledTextField(
                  label: 'User ID :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.userId.value = value,
                  validator: AppValidator.validateID,
                ),

                // Password field
                LabeledTextField(
                  label: 'Password :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.password.value = value,
                  validator: AppValidator.validatePassword,
                ),

                // Designation field
                LabeledTextField(
                  label: 'Designation :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.designation.value = value,
                ),

                // Date of Birth field
                Obx(
                  () => LabeledTextField(
                    label: 'Date of Birth :',
                    controller: TextEditingController()
                      ..text = controller.dateOfBirth.value,
                    readOnly: true,
                    onTap: () {
                      Get.dialog(Dialog(
                        child: CustomCalendarWidget(
                          onDaySelected: (p0) {
                            controller.dateOfBirth.value =
                                AppHelperFunctions.getFormattedDate(p0);
                          },
                        ),
                      ));
                    },
                  ),
                ),

                // Gender field
                LabeledTextField(
                  label: 'Gender :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.gender.value = value,
                ),

                // Specialization field
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Specialization :',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF526366),
                          ),
                        ),
                      ),
                      HorizontalSpace(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: specializationCT,
                              onChange: (value) {},
                              // validator: (value) {
                              //   if (controller.specializations.isEmpty) {
                              //     return "Specialization is required";
                              //   }
                              //   return null;
                              // },
                            ),
                            SizedBox(height: 8),
                            Obx(() => Column(
                                  children: List.generate(
                                    controller.specializations.length,
                                    (index) => Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFDDDDDD)),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                controller
                                                    .specializations.reversed
                                                    .toList()[index],
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete_outline,
                                                color: Colors.red),
                                            onPressed: () => controller
                                                .removeSpecialization(index),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(height: 8),
                            CustomButton(
                              onTap: () {
                                // Implementation for adding a specialization field
                                controller
                                    .addSpecialization(specializationCT.text);
                                specializationCT.clear();
                              },
                              title: "",
                              isChild: true,
                              isPrimary: false,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Add Field',
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Job Details Section
                Text(
                  'Job Details :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16),

                // Role field
                LabeledTextField(
                  label: 'Role :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.role.value = value,
                ),

                // Service Length field
                LabeledTextField(
                  label: 'Service Length :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.serviceLength.value = value,
                ),

                // Department field
                LabeledTextField(
                  label: 'Department :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.department.value = value,
                ),

                SizedBox(height: 24),

                // Administrative Info Section
                Text(
                  'Administrative Info :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16),

                // Joining Date field
                Obx(
                  () => LabeledTextField(
                    label: 'Joining Date :',
                    controller: TextEditingController()
                      ..text = controller.joiningDate.value,
                    readOnly: true,
                    onTap: () {
                      Get.dialog(
                        Dialog(
                          child: CustomCalendarWidget(
                            onDaySelected: (date) {
                              controller.joiningDate.value =
                                  AppHelperFunctions.getFormattedDate(date);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Work Location field
                LabeledTextField(
                  label: 'Work Location :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.workLocation.value = value,
                ),

                // Employment Type field
                LabeledTextField(
                  label: 'Employment Type :',
                  controller: TextEditingController(),
                  onChanged: (value) => controller.employmentType.value = value,
                ),

                SizedBox(height: 24),

                // Add Employee button
                CustomButton(
                    onTap: () {
                      if (formstate.currentState!.validate()) {
                        controller.addEmployee();
                      }
                    },
                    title: "Add Employee"),

                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
