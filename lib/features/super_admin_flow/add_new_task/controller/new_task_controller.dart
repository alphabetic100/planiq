import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';

class NewTaskController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final GlobalKey<FormState> formstate2 = GlobalKey<FormState>();
  RxList taskChecklist = ["Get Wormd up"].obs;
  RxList taskToolsList = ["Hammer"].obs;
  var images = <File>[].obs;
  RxString title = "".obs;
  RxString location = "".obs;
  RxString date = "sdfe".obs;
  RxString time = "sdfe".obs;
  RxString mapLink = "".obs;
  RxString description = "".obs;
  RxString paymentRate = "".obs;
  RxString duration = "".obs;
  RxString adminNote = "".obs;
  RxString customerName = "".obs;
  RxString customerNumber = "".obs;
  RxString managerName = "".obs;
  RxString managerNumber = "".obs;

// Create Task
  Future<void> createNewTask() async {
    log("message");
    try {
      final requestBody = {
        "title": title.value,
        "location": location.value,
        "date": date.value,
        "time": time.value,
        "locationLink": location.value,
        "description": description.value,
        "rate": "\$${paymentRate.value}",
        "duration": duration.value,
        "note": adminNote.value,
        "progress": taskChecklist,
        "requiredTools": taskToolsList,
        "customerName": customerName.value,
        "customerPhone": customerNumber.value,
        "managerName": managerName.value,
        "managerPhone": managerNumber.value,
      };

      log("Selected request body: $requestBody");
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }

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
      images.add(File(pickedFile.path));
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
  }
}
