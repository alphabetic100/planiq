import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/employee_card.dart';
import 'package:planiq/features/super_admin_flow/users/controller/blocklist_controller.dart';

class AllBlockListScreen extends StatelessWidget {
  AllBlockListScreen({super.key});
  final BlocklistController blocklistController =
      Get.put(BlocklistController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Blocklist",
        backButton: true,
      ),
      body: BodyPadding(
        child: Column(
          children: [
            VerticalSpace(height: 20),
            Expanded(
              child: Obx(
                () => blocklistController.blocklist.value == null
                    ? Center(
                        child: CustomText(text: "Blocklist is empty"),
                      )
                    : blocklistController.blocklist.value!.data.isEmpty
                        ? Center(
                            child: CustomText(text: "Blocklist is empty"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: blocklistController
                                .blocklist.value!.data.length,
                            itemBuilder: (context, index) {
                              final user = blocklistController
                                  .blocklist.value!.data[index];
                              return EmployeeCard(
                                  isBlocklist: true,
                                  profileImage: user.profileImage,
                                  name: user.name,
                                  employeID: user.personId,
                                  role: "",
                                  id: user.id);
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
