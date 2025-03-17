import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/employe_flow/jobs/model/my_jobs_model.dart';

class GetMyTasksController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<MyJobsModel?> myTasks = Rx(null);
  @override
  void onInit() {
    super.onInit();
    getMytasks();
  }

  Future<void> getMytasks() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.myTasks,
          token: AuthService.token);
      if (response.isSuccess) {
        myTasks.value = MyJobsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
