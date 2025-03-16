import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';

class JobsController extends GetxController {
  void downloadTaskCSV() {
    try {
      AppHelperFunctions.launchURL(AppUrls.downloadTasklistCSV);
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  void handelEmployeeAction(String action) {
    switch (action) {
      case "Export Task Data":
        downloadTaskCSV();
        break;
      case "Export Customer List":
        break;
    }
  }
}
