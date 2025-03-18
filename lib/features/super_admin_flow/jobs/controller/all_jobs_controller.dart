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
  Rx<List<Job>> filteredJobs = Rx<List<Job>>([]);

  // Fetch all job data from the network
  Future<void> getJobList(String url) async {
    try {
      showProgressIndicator(); // Show loading indicator
      final response =
          await networkCaller.getRequest(url, token: AuthService.token);
      hideProgressIndicatro(); // Hide loading indicator
      if (response.isSuccess) {
        jobs.value = AllJobsListModel.fromJson(response.responseData);
        filteredJobs.value = jobs.value?.data.jobs ?? [];
      } else {
        errorSnakbar(
            errorMessage: response.errorMessage); // Show error if failed
      }
    } catch (e) {
      log("Something went wrong, error: $e");
      hideProgressIndicatro(); // Hide loading indicator on error
    }
  }

  // Refresh job list
  Future<void> refreshAllJob(String url) async {
    try {
      final response =
          await networkCaller.getRequest(url, token: AuthService.token);
      if (response.isSuccess) {
        jobs.value = AllJobsListModel.fromJson(response.responseData);
        filteredJobs.value = jobs.value?.data.jobs ?? [];
      } else {
        errorSnakbar(
            errorMessage: response.errorMessage); // Show error if failed
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  // Toggle expanded state based on search query
  void toggleExpanded() {
    if (searchController.text.isEmpty) {
      isExpanded.value = !isExpanded.value; // Toggle if no search query
    }
  }

  // Filter jobs based on search query
  void filterJobs(String query) {
    if (query.isEmpty) {
      filteredJobs.value =
          jobs.value?.data.jobs ?? []; // Show all jobs if query is empty
    } else {
      filteredJobs.value = jobs.value?.data.jobs
              .where((job) => job.title
                  .toLowerCase()
                  .contains(query.toLowerCase())) // Filter based on title
              .toList() ??
          [];
    }
    log("Filtered Jobs: ${filteredJobs.value}");
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      getJobList(AppUrls.allJobs); // Fetch jobs after the widget is initialized
    });
  }
}
