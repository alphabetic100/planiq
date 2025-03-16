import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/employe_flow/profile/model/profile_details_model.dart';

class ProfileController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<ProfileDetailsModel?> profile = Rx(null);
  Future<void> getMyProfile() async {
    try {
      showProgressIndicator();
      final response = await networkCaller.getRequest(AppUrls.myProfile,
          token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        profile.value = ProfileDetailsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      getMyProfile();
    });
  }
}
