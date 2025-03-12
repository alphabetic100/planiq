import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/employe/model/all_employee_model.dart';

class EmployeeListScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  final TextEditingController searchController = TextEditingController();
  final isExpanded = false.obs;

  Rx<AllEmployeeData?> employes = Rx<AllEmployeeData?>(null);

  Future<void> getAllEmployes() async {
    try {
      final resonse = await networkCaller.getRequest(AppUrls.register,
          token: AuthService.token);
      log(resonse.responseData.toString());

      if (resonse.isSuccess) {
        employes.value = AllEmployeeData.fromJson(resonse.responseData);
      }
    } catch (e) {
      log("something went wrong, error:$e");
    }
  }

  void toggleExpanded() {
    if (searchController.text.isEmpty) {
      isExpanded.value = !isExpanded.value;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllEmployes();
  }
}
