import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/employe/presentation/widget/employee_card.dart';

class AllBlockListScreen extends StatelessWidget {
  const AllBlockListScreen({super.key});

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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return EmployeeCard(
                    isBlocklist: true,
                    profileImage: "employe.profileImage",
                    name: "employe.name",
                    employeID: "employe.id",
                    role: " employe.role",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
