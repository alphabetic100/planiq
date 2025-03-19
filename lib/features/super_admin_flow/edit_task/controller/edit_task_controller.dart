import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/employe_flow/job_details/model/job_details_model.dart';

class EditTaskController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  final ImagePicker _picker = ImagePicker();
  Rx<JobDetailsModel?> jobDetails = Rx<JobDetailsModel?>(null);
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final GlobalKey<FormState> formstate2 = GlobalKey<FormState>();
  RxList<String> taskChecklist = <String>[].obs;
  RxList taskToolsList = [].obs;
  var images = <String>[].obs;
  RxString title = "".obs;
  RxString location = "".obs;
  RxString date = "".obs;
  RxString time = "".obs;
  RxString mapLink = "".obs;
  RxString description = "".obs;
  RxString paymentRate = "".obs;
  RxString duration = "".obs;
  RxString adminNote = "".obs;
  RxString customerName = "".obs;
  RxString customerNumber = "".obs;
  RxString managerName = "".obs;
  RxString managerNumber = "".obs;

  //
  void addChecklist(String title) {
    if (title.isNotEmpty) {
      taskChecklist.add(title);
    }
  }

  void deleteChecklist(String title) {
    taskChecklist.remove(title);
  }

  void addTools(String title) {
    if (title.isNotEmpty) {
      taskToolsList.add(title);
    }
  }

  void deleteTools(String title) {
    taskToolsList.remove(title);
  }

  Future<void> pickImages() async {
    if (images.length >= 6) {
      errorSnakbar(errorMessage: "You can only add up to 6 images.");
      return;
    }
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.add((pickedFile.path));
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
  }

//Get task details first

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
        if (jobDetails.value != null) {
          final details = jobDetails.value!.data;
          images.value = details.image;
          title.value = details.title;
          location.value = details.location;
          date.value = details.date;
          time.value = details.time;
          mapLink.value = details.locationLink;
          description.value = details.description;
          paymentRate.value = details.rate;
          duration.value = details.duration;
          adminNote.value = details.note;
          taskToolsList.value = details.requiredTools;
          customerName.value = details.customerName;
          customerNumber.value = details.customerPhone;
          managerName.value = details.managerName;
          managerNumber.value = details.managerPhone;
          taskChecklist.value =
              details.progress.map((step) => step.progress.toString()).toList();
        }
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

// Create Task
  Future<void> updateTask(String taskID) async {
    try {
      showProgressIndicator();
      Dio dioClient = Dio(BaseOptions(
        connectTimeout: Duration(seconds: 60),
        validateStatus: (status) {
          return status! < 500;
        },
      ));
      final requestBody = {
        "title": title.value,
        "location": location.value,
        "date": date.value,
        "time": time.value,
        "locationLink": mapLink.value,
        "description": description.value,
        "rate": paymentRate.value,
        "duration": duration.value,
        "note": adminNote.value,
        "progress": taskChecklist,
        "requiredTools": taskToolsList,
        "customerName": customerName.value,
        "customerPhone": customerNumber.value,
        "managerName": managerName.value,
        "managerPhone": managerNumber.value,
      };
      final bodyData = jsonEncode(requestBody);
      List<dio.MultipartFile> imageList = [];
      for (var image in images) {
        if (image.contains("http")) {
          log("Http found $image");
          continue;
        } else {
          String fileName = AppHelperFunctions.generateUniqueFileName(image);
          dio.MultipartFile file = await dio.MultipartFile.fromFile(
            image,
            filename: fileName,
          );
          imageList.add(file);
        }
      }
      log("Im here ");
      final formData = dio.FormData.fromMap(
        {
          "bodyData": bodyData,
          "image": imageList,
        },
      );
      final requestURl = "${AppUrls.allJobs}/$taskID";

      final response = await dioClient.put(requestURl,
          data: formData,
          options: Options(headers: {
            "Authorization": AuthService.token,
            'Content-Type': 'multipart/form-data',
          }));
      hideProgressIndicatro();
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        successSnakbr(successMessage: "Task created successfully");
        Get.back();
      }
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }
}
