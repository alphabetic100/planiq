import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/super_admin_flow/employe/model/all_employee_model.dart';
import 'package:planiq/features/super_admin_flow/users/presentation/screens/all_block_list_screen.dart';

class EmployeeListScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  final TextEditingController searchController = TextEditingController();
  final isExpanded = false.obs;

  RxList<Datum> employees = <Datum>[].obs;
  RxList<Datum> filteredEmployees = <Datum>[].obs;

  Future<void> getAllEmployes() async {
    try {
      final response = await networkCaller.getRequest(
        AppUrls.register,
        token: AuthService.token,
      );
      log(response.responseData.toString());

      if (response.isSuccess) {
        final allEmployees =
            AllEmployeeData.fromJson(response.responseData).data.data;
        employees.assignAll(allEmployees);
        filteredEmployees.assignAll(allEmployees);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  void toggleExpanded() {
    if (searchController.text.isEmpty) {
      isExpanded.value = !isExpanded.value;
    }
  }

  Future<void> downloadCSVfile() async {
    try {
      AppHelperFunctions.launchURL(AppUrls.downloadUserCSV);
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  void handelEmployeeAction(String action) {
    switch (action) {
      case "Export Employee Data":
        downloadCSVfile();
        break;
      case "See Blocklist":
        Get.to(() => AllBlockListScreen());
        break;
    }
  }

  void searchEmployees(String query) {
    if (query.isEmpty) {
      filteredEmployees.assignAll(employees);
    } else {
      filteredEmployees.assignAll(
        employees
            .where((employee) =>
                    employee.name.toLowerCase().contains(query.toLowerCase()) ||
                    employee.personId
                        .toLowerCase()
                        .contains(query.toLowerCase()) // Search by ID
                )
            .toList(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllEmployes();
  }
}
