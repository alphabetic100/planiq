import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/models/response_data.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/routes/app_routes.dart';

class LoginController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Future<void> logIN(String id, String password) async {
    showProgressIndicator();
    try {
      final Map<String, String> requestBody = {
        "personId": id.trim(),
        "password": password,
        "fcmToken": "TEST_FCM_TOKEN"
      };
      //Hit Api
      final response =
          await networkCaller.postRequest(AppUrls.login, body: requestBody);
      responseHandeller(response);
      hideProgressIndicatro();
    } catch (e) {
      log("Seomething went wrong, error: $e");
      errorSnakbar(errorMessage: "Something went wrong, please try againg");
    }
  }

  void responseHandeller(ResponseData response) async {
    if (response.isSuccess) {
      final token = response.responseData["data"]["accessToken"];
      final role = response.responseData["data"]["userData"]["role"];
      final userName = response.responseData["data"]["userData"]["name"];
      log(response.responseData["data"]["accessToken"]);
      log(response.responseData["data"]["userData"]["role"]);

      await AuthService.saveToken(
        token,
        role,
      );
      navigateRule(role);

      successSnakbr(successMessage: "Welcome back! $userName");
    } else if (response.statusCode == 404) {
      errorSnakbar(errorMessage: "ID or Passord incorrect");
    }
  }

  navigateRule(String role) {
    switch (role) {
      case 'SUPERADMIN':
        return Get.offAllNamed(AppRoute.superLandingScreen);
      case "USER":
        return Get.offAllNamed(AppRoute.landingPage);
      case " SUPERVISER":
        return Get.offAllNamed(AppRoute.supervisorLandingScreen);
    }
  }
}
