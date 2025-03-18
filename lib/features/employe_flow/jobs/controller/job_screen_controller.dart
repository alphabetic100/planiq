import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/employe_flow/jobs/model/my_jobs_model.dart';

class JobScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<MyJobsModel?> allJobs = Rx(null);
  Rx<MyJobsModel?> compleated = Rx(null);
  RxInt selectedTab = 1.obs;
  void changeTab(int index) {
    selectedTab.value = index;
  }

  Future<void> getAllJobs() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.myTasks,
          token: AuthService.token);
      if (response.isSuccess) {
        allJobs.value = MyJobsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> getCompleatedTasks() async {
    try {
      final requestUrl = "${AppUrls.myTasks}?search=COMPLETED";
      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      if (response.isSuccess) {
        compleated.value = MyJobsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllJobs();
    getCompleatedTasks();
  }
}
