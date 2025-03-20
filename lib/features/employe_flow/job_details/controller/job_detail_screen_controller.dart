import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/employe_flow/job_details/model/assigned_task_model.dart';
import 'package:planiq/features/employe_flow/job_details/model/job_details_model.dart';

class JobDetailScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<JobDetailsModel?> jobDetails = Rx<JobDetailsModel?>(null);
  Rx<AssignedTaskModel?> employeeDetail = Rx<AssignedTaskModel?>(null);
  RxString selectedType = "".obs;
  RxBool isPaymentSuccess = false.obs;
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

  Future<void> getAssignedJobDetails(String jobID) async {
    if (jobID.isEmpty) {
      log("jobid is empty");
      return;
    }
    try {
      final requestUrl = "${AppUrls.assignedTask}$jobID";
      log(requestUrl);
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);

      if (response.isSuccess) {
        log("Success");
        employeeDetail.value =
            AssignedTaskModel.fromJson(response.responseData);
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
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
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
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

//Decline task for employee
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
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

//Recive payment request for employee
  Future<void> makePaynemt(
      String jobID, String paymentAmount, String extraNote) async {
    if (selectedType.value == "") {
      errorSnakbar(errorMessage: "Please select the payment mathod");
      return;
    }
    try {
      final requestUrl = "${AppUrls.tasks}/payment/$jobID";
      final response = await networkCaller.postRequest(requestUrl,
          token: AuthService.token,
          body: {
            "amount": paymentAmount,
            "note": extraNote,
            "paymentMethod": selectedType.value
          });

      if (response.isSuccess) {
        isPaymentSuccess.value = true;
        successSnakbr(successMessage: "Payment created successfully!");
        refreshScreen(jobID);
        update();
      } else {
        isPaymentSuccess.value = false;
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      isPaymentSuccess.value = false;
      log("Something went wrong, error: $e");
    }
  }

//Report issue for employee
  Future<void> reportIssue(String issue, String jobID) async {
    try {
      final String requestURL = "${AppUrls.reportIssue}$jobID";
      showProgressIndicator();
      final response = await networkCaller
          .postRequest(requestURL, token: AuthService.token, body: {
        "issue": issue,
      });
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(successMessage: "Submitted issue successfully!");
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

// Update job progress as employee
  Future<void> updateJobProgress(String title, String jobID) async {
    try {
      final requestUrl = "${AppUrls.updateProgress}$jobID";
      showProgressIndicator();
      final response = await networkCaller
          .putRequest(requestUrl, token: AuthService.token, body: {
        "progress": title,
      });
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(successMessage: "Job progress updated successfully");
        refreshScreen(jobID);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

//change payment mathode
  void changeMethod(String methode) {
    selectedType.value = methode;
  }

  //Compleate Task
  Future<void> completeTask(
      String jobID, String notes, List<String> workPhoto) async {
    final Dio dioClient = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    try {
      // Request url
      final requestUrl = "${AppUrls.completeTask}$jobID";
      //List of images to sent
      List<dio.MultipartFile> images = [];
      for (var image in workPhoto) {
        if (image.isNotEmpty) {
          final temp = await dio.MultipartFile.fromFile(
            image,
            filename: AppHelperFunctions.generateUniqueFileName(image),
          );
          images.add(temp);
        } else {
          continue;
        }
        final dio.FormData requestForm = dio.FormData.fromMap({
          "notes": notes,
          "workPhoto": images,
        });

        final response = await dioClient.patch(requestUrl,
            data: requestForm,
            options: dio.Options(headers: {
              "Authorization": AuthService.token,
              'Content-Type': 'multipart/form-data',
            }));

        if (response.statusCode == 200 || response.statusCode == 201) {
          successSnakbr(
              successMessage: "Task has been compleated successfully");
        } else {}
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
