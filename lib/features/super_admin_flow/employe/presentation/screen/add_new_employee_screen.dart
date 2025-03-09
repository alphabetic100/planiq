import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/add_new_employe_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/labeled_text_field.dart';

class AddNewEmployeeScreen extends StatelessWidget {
  AddNewEmployeeScreen({super.key});

  final AddNewEmployeeController controller =
      Get.put(AddNewEmployeeController());

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5E5E5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
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
              ),

              // User ID field
              LabeledTextField(
                label: 'User ID :',
                controller: TextEditingController(),
                onChanged: (value) => controller.userId.value = value,
              ),

              // Password field
              LabeledTextField(
                label: 'Password :',
                controller: TextEditingController(),
                onChanged: (value) => controller.password.value = value,
                obscureText: true,
              ),

              // Designation field
              LabeledTextField(
                label: 'Designation :',
                controller: TextEditingController(),
                onChanged: (value) => controller.designation.value = value,
              ),

              // Date of Birth field
              LabeledTextField(
                label: 'Date of Birth :',
                controller: TextEditingController(),
                onChanged: (value) => controller.dateOfBirth.value = value,
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
                          color: Color(0xFF575757),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: TextEditingController(),
                            onChange: (value) {},
                          ),
                          SizedBox(height: 8),
                          Obx(() => Column(
                                children: List.generate(
                                  controller.specializations.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child:
                                        Text(controller.specializations[index]),
                                  ),
                                ),
                              )),
                          SizedBox(height: 8),
                          CustomButton(
                            onTap: () {
                              // Implementation for adding a specialization field
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final textController =
                                      TextEditingController();
                                  return AlertDialog(
                                    title: Text('Add Specialization'),
                                    content: TextField(
                                      controller: textController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter specialization',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.addSpecialization(
                                              textController.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Add'),
                                      ),
                                    ],
                                  );
                                },
                              );
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
              LabeledTextField(
                label: 'Joining Date :',
                controller: TextEditingController(),
                onChanged: (value) => controller.joiningDate.value = value,
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
              CustomButton(onTap: () {}, title: "Add Employee"),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
