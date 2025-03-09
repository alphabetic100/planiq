import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class EmployeProfileDetailsScreen extends StatelessWidget {
  const EmployeProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Profile Details",
        backButton: true,
      ),
    );
  }
}
