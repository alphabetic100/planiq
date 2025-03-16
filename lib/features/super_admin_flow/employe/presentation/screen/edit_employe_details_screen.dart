import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_calendar_widget.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/edit_employee_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/labeled_text_field.dart';

class EditEmployeeDetailsScreen extends StatefulWidget {
  const EditEmployeeDetailsScreen({super.key, required this.employeeID});
  final String employeeID;

  @override
  State<EditEmployeeDetailsScreen> createState() =>
      _EditEmployeeDetailsScreenState();
}

class _EditEmployeeDetailsScreenState extends State<EditEmployeeDetailsScreen> {
  final EditEmployeeController controller = Get.put(EditEmployeeController());

  final TextEditingController specializationCT = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchEmployeeDetails(widget.employeeID).then((onValue) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B7A8A),
        title: Text(
          'Edit Employee Details',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Center(
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Color(0xFFE5E5E5),
                            shape: BoxShape.circle,
                            image: controller.employeeImage.value.isNotEmpty
                                ? DecorationImage(
                                    image: controller.employeeImage.value
                                            .contains("http")
                                        ? NetworkImage(
                                            controller.employeeImage.value)
                                        : FileImage(
                                            File(
                                                controller.employeeImage.value),
                                          ),
                                    fit: BoxFit.cover,
                                  )
                                : null),
                        child: controller.employeeImage.value.isEmpty
                            ? Icon(
                                Icons.person,
                                size: 80,
                                color: Color(0xFFAAAAAA),
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => controller.selectProfileImage(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
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
                controller: TextEditingController(text: controller.name.value),
                onChanged: (value) => controller.name.value = value,
              ),

              // User ID field
              LabeledTextField(
                label: 'User ID :',
                controller:
                    TextEditingController(text: controller.userId.value),
                onChanged: (value) => controller.userId.value = value,
              ),

              // Password field
              LabeledTextField(
                readOnly: true,
                label: 'Password :',
                controller:
                    TextEditingController(text: controller.password.value),
                onChanged: (value) => controller.password.value = value,
              ),

              // Designation field
              LabeledTextField(
                label: 'Designation :',
                controller:
                    TextEditingController(text: controller.designation.value),
                onChanged: (value) => controller.designation.value = value,
              ),

              // Date of Birth field
              Obx(
                () => LabeledTextField(
                  readOnly: true,
                  label: 'Date of Birth :',
                  controller: TextEditingController(
                      text: AppHelperFunctions.backendFomater(
                              controller.dateOfBirth.toString()) ??
                          "N/A"),
                  onChanged: (value) => controller.dateOfBirth.value = value,
                  onTap: () {
                    Get.dialog(Dialog(
                      child: CustomCalendarWidget(
                        onDaySelected: (p0) {
                          controller.dateOfBirth.value = p0.toString();
                          // AppHelperFunctions.getFormattedDate(p0);
                        },
                      ),
                    ));
                  },
                ),
              ),

              // Gender field
              LabeledTextField(
                label: 'Gender :',
                controller:
                    TextEditingController(text: controller.gender.value),
                onChanged: (value) => controller.gender.value = value,
              ),

              // Specialization field with multiple choices
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
                    HorizontalSpace(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: specializationCT,
                            onChange: (value) {},
                          ),
                          SizedBox(height: 8),
                          Obx(() => Column(
                                children: List.generate(
                                  controller.specializations.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFDDDDDD)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
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
                          CustomButton(
                            onTap: () {
                              controller
                                  .addSpecialization(specializationCT.text);
                              specializationCT.clear();
                              // Implementation for adding a field
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
                controller: TextEditingController(text: controller.role.value),
                onChanged: (value) => controller.role.value = value,
              ),

              // Service Length field
              LabeledTextField(
                label: 'Service Length :',
                controller:
                    TextEditingController(text: controller.serviceLength.value),
                onChanged: (value) => controller.serviceLength.value = value,
              ),

              // Department field
              LabeledTextField(
                label: 'Department :',
                controller:
                    TextEditingController(text: controller.department.value),
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
                    readOnly: true,
                    label: 'Joining Date :',
                    controller: TextEditingController(
                        text: AppHelperFunctions.backendFomater(
                                controller.joiningDate.value.toString()) ??
                            "N/A"),
                    onChanged: (value) => controller.joiningDate.value = value,
                    onTap: () {
                      Get.dialog(Dialog(child: CustomCalendarWidget(
                        onDaySelected: (p0) {
                          controller.joiningDate.value = p0.toString();
                        },
                      )));
                    }),
              ),

              // Work Location field
              LabeledTextField(
                label: 'Work Location :',
                controller:
                    TextEditingController(text: controller.workLocation.value),
                onChanged: (value) => controller.workLocation.value = value,
              ),

              // Employment Type field
              LabeledTextField(
                label: 'Employment Type :',
                controller: TextEditingController(
                    text: controller.employmentType.value),
                onChanged: (value) => controller.employmentType.value = value,
              ),

              SizedBox(height: 24),

              // Save Changes button
              CustomButton(
                  onTap: () => controller.saveChanges(), title: "Save Changes"),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
