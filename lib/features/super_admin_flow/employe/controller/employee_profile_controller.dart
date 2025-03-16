import 'dart:developer';

import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_progress_indicator.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/core/common/widgets/success_snakbar.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/services/network_caller.dart';
import 'package:planiq/core/utils/constants/app_urls.dart';
import 'package:planiq/features/super_admin_flow/employe/model/employe_details_model.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/edit_employe_details_screen.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/show_block_employee_dialog.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/show_update_rule_dialog.dart';

class EmployeeProfileController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();
  Rx<EmployeDetailsModel?> profile = Rx<EmployeDetailsModel?>(null);
  RxString employeeID = "".obs;
  RxString employeeName = "".obs;

  Future<void> getProfileDetails(String profileID) async {
    try {
      showProgressIndicator();
      final requestUrl = "${AppUrls.register}/$profileID";
      log("Requesting url : $requestUrl");

      final response =
          await networkCaller.getRequest(requestUrl, token: AuthService.token);
      hideProgressIndicatro();
      if (response.isSuccess) {
        profile.value = EmployeDetailsModel.fromJson(response.responseData);
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }

  Future<void> makeSuperVisor(String employeID, String employeName) async {
    try {
      showProgressIndicator();
      final requestBody = {"role": "SUPERVISER"};
      final requestUrl = "${AppUrls.register}/role/$employeID";
      final response = await networkCaller.patchRequest(requestUrl,
          token: AuthService.token, body: requestBody);
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(
            successMessage: "$employeName has been promoted to Supervisor");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> blockEmployee(String employeID, String employeName) async {
    try {
      showProgressIndicator();
      final requestBody = {"status": "BLOCKED"};
      final requestUrl = "${AppUrls.register}/status/$employeID";
      final response = await networkCaller.patchRequest(requestUrl,
          token: AuthService.token, body: requestBody);
      hideProgressIndicatro();
      if (response.isSuccess) {
        successSnakbr(
            successMessage: "$employeName has been blocked successfully.");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  void handleProfileAction(String selectedAction, String employeeID) {
    if (selectedAction == "Block Employee") {
      Get.dialog(ShowBlockEmployeeDialog());
    } else if (selectedAction == "Make Supervisor") {
      Get.dialog(ShowUpdateRuleDialog());
    } else if (selectedAction == "Edit Details") {
      Get.to(() => EditEmployeeDetailsScreen(
            employeeID: employeeID,
          ));
    }
  }
}
