import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeListScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final isExpanded = false.obs;
  void toggleExpanded() {
    if (searchController.text.isEmpty) {
      isExpanded.value = !isExpanded.value;
    }
  }
}
