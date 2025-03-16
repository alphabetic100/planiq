import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/users/model/user_blocklist_model.dart';

class BlocklistController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<UserBlocklistModel?> blocklist = Rx(null);
  Future<void> getBlockList() async {
    try {
      showProgressIndicator();
      final request = await networkCaller.getRequest(AppUrls.blockList,
          token: AuthService.token);
      hideProgressIndicatro();
      if (request.isSuccess) {
        blocklist.value = UserBlocklistModel.fromJson(request.responseData);
      } else {
        errorSnakbar(errorMessage: request.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      getBlockList();
    });
  }
}
