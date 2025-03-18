import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/admin_overview_profile.dart';
import 'package:planiq/features/supervisor_flow/overview/presentation/widget/supervisor_overview_body.dart';
import 'package:planiq/features/supervisor_flow/overview/presentation/widget/supervisor_overview_drawer.dart';

class SupervisorOverviewScreen extends StatelessWidget {
  SupervisorOverviewScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SupervisorOverviewDrawer(),
      body: Column(
        children: [
          AdminOverviewProfile(
            scaffoldKey: _scaffoldKey,
            isfromAdmin: false,
          ),
          VerticalSpace(height: 24.h),
          BodyPadding(child: SupervisorOverviewBody())
        ],
      ),
    );
  }
}
