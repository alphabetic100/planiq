import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/employe_flow/profile/model/profile_details_model.dart';

class ProfileController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<ProfileDetailsModel?> profile = Rx(null);
  RxString employeeImage = "".obs;
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

  Future<void> selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && image.path.isNotEmpty) {
      employeeImage.value = image.path;
      final Dio dioClient = Dio();
      final dio.FormData formData = dio.FormData.fromMap({
        "profileImage": await dio.MultipartFile.fromFile(employeeImage.value,
            filename: "profile${DateTime.now().millisecondsSinceEpoch}.jpg"),
      });
      final response = await dioClient.patch(
        AppUrls.updateProfileImage,
        options: Options(
          headers: {
            "Authorization": AuthService.token,
            'Content-Type': 'multipart/form-data',
          },
        ),
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        successSnakbr(successMessage: "Profile image updated successfully");
      } else {
        errorSnakbar(errorMessage: "Failed to update profile image");
      }
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
