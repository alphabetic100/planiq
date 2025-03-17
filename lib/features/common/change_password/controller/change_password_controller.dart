import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';

class ChangePasswordController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      showProgressIndicator();
      final response = await networkCaller.patchRequest(
        AppUrls.updatePassword,
        token: AuthService.token,
        body: {
          'currentPass': oldPassword,
          'newPass': newPassword,
        },
      );
      hideProgressIndicatro();
      if (response.isSuccess) {
        Get.back();
        successSnakbr(successMessage: "Password changed successfully");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }
}
