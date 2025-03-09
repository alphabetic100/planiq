import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewEmployeeController extends GetxController {
  // Observable variables for form fields
  final name = "David Andrew".obs;
  final userId = "11226".obs;
  final password = "5451654".obs;
  final designation = "Plumber".obs;
  final dateOfBirth = "24/08/1996".obs;
  final gender = "Male".obs;

  final specializations =
      <String>["Drain Cleaning", "Installation", "Pipe Repair"].obs;

  final role = "Senior Plumber".obs;
  final serviceLength = "2 Years 3 Months".obs;
  final department = "Plumbing Operations".obs;

  final joiningDate = "01/04/2023".obs;
  final workLocation = "New York City, NY".obs;
  final employmentType = "Permanent".obs;
  void addSpecialization(String specialization) {
    if (specialization.isNotEmpty &&
        !specializations.contains(specialization)) {
      specializations.add(specialization);
    }
  }


  void removeSpecialization(int index) {
    if (index >= 0 && index < specializations.length) {
      specializations.removeAt(index);
    }
  }

  void addEmployee() {
    if (name.value.isEmpty || userId.value.isEmpty || password.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      'Success',
      'Employee added successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    clearForm();
  }

  void saveChanges() {
    // Validate required fields
    if (name.value.isEmpty || userId.value.isEmpty || password.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Implementation for saving changes
    Get.snackbar(
      'Success',
      'Employee details updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void clearForm() {
    name.value = '';
    userId.value = '';
    password.value = '';
    designation.value = '';
    dateOfBirth.value = '';
    gender.value = '';
    specializations.clear();
    role.value = '';
    serviceLength.value = '';
    department.value = '';
    joiningDate.value = '';
    workLocation.value = '';
    employmentType.value = '';
  }
}
