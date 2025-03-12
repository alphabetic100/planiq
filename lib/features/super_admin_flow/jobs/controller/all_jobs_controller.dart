import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/jobs/model/all_jobs_list_model.dart';

class AllJobsController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  final TextEditingController searchController = TextEditingController();
  final isExpanded = false.obs;
  Rx<AllJobsListModel?> jobs = Rx<AllJobsListModel?>(null);

  Future<void> getJobList(String url) async {
    try {
      showProgressIndicator();
      final response =
          await networkCaller.getRequest(url, token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        jobs.value = AllJobsListModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> refreshAllJob(String url) async {
    try {
      final response =
          await networkCaller.getRequest(url, token: AuthService.token);

      if (response.isSuccess) {
        jobs.value = AllJobsListModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      getJobList(AppUrls.allJobs);
    });
  }
}
