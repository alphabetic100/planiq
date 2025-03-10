import 'package:get/get.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/screen/edit_employe_details_screen.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/show_block_employee_dialog.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/show_update_rule_dialog.dart';

class EmployeeProfileController extends GetxController {
  void handleProfileAction(String selectedAction) {
    if (selectedAction == "Block Employee") {
      Get.dialog(ShowBlockEmployeeDialog());
    } else if (selectedAction == "Make Supervisor") {
      Get.dialog(ShowUpdateRuleDialog());
    } else if (selectedAction == "Edit Details") {
      Get.to(() => EditEmployeeDetailsScreen());
    }
  }
}
