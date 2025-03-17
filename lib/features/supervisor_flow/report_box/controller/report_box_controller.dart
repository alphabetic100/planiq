import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/supervisor_flow/report_box/model/report_box_model.dart';

class ReportBoxController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<ReportBoxModel?> reporst = Rx(null);
  @override
  onInit() {
    super.onInit();
    getReports();
  }

  Future<void> getReports() async {
    try {
      final response = await networkCaller.getRequest(
        AppUrls.getReports,
        token: AuthService.token,
      );
      if (response.isSuccess) {
        reporst.value = ReportBoxModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
