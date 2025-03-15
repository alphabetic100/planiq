import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/employe_flow/job_details/model/job_details_model.dart';

class JobDetailScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<JobDetailsModel?> jobDetails = Rx<JobDetailsModel?>(null);
  Future<void> getJobDetails(String jobID) async {
    if (jobID.isEmpty) {
      log("jobid is empty");
      return;
    }
    try {
      showProgressIndicator();
      final requestUrl = "${AppUrls.allJobs}/$jobID";

      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        jobDetails.value = JobDetailsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> refreshScreen(String jobID) async {
    if (jobID.isEmpty) {
      log("jobid is empty");
      return;
    }
    try {
      final requestUrl = "${AppUrls.allJobs}/$jobID";

      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);

      if (response.isSuccess) {
        jobDetails.value = JobDetailsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> acceptTask(String jobID) async {
    try {
      showProgressIndicator();
      final requestUrl = "${AppUrls.tasks}/accept/$jobID";
      final response = await networkCaller.patchRequest(requestUrl,
          token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(
            successMessage: "You have successfully accepted the task!");
        refreshScreen(jobID);
        update();
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> startJob(String jobID) async {
    try {
      showProgressIndicator();
      final requestUrl = "${AppUrls.tasks}/progress/$jobID";
      final response = await networkCaller.patchRequest(requestUrl,
          token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(
            successMessage: "You have successfully started the task!");
        refreshScreen(jobID);
        update();
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> declineTask(String jobID) async {
    try {
      showProgressIndicator();
      final requestUrl = "${AppUrls.tasks}/decline/$jobID";
      final response = await networkCaller.patchRequest(requestUrl,
          token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(successMessage: "You have decline the task!");
        refreshScreen(jobID);
        update();
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
