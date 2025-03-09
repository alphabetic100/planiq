import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/features/super_admin_flow/employe/controller/add_new_employe_controller.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/labeled_text_field.dart';

class EditEmployeeDetailsScreen extends StatelessWidget {
  EditEmployeeDetailsScreen({super.key});

  final AddNewEmployeeController controller =
      Get.put(AddNewEmployeeController());

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
              LabeledTextField(
                label: 'Date of Birth :',
                controller:
                    TextEditingController(text: controller.dateOfBirth.value),
                onChanged: (value) => controller.dateOfBirth.value = value,
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
                          color: Color(0xFF575757),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                              controller.specializations[index],
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
                              // Implementation for adding a field
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
              LabeledTextField(
                label: 'Joining Date :',
                controller:
                    TextEditingController(text: controller.joiningDate.value),
                onChanged: (value) => controller.joiningDate.value = value,
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
