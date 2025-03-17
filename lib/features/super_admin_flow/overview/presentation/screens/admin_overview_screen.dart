import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/admin_overview_body.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/admin_overview_drawer.dart';
import 'package:planiq/features/super_admin_flow/overview/presentation/widget/admin_overview_profile.dart';

class AdminOverviewScreen extends StatelessWidget {
  AdminOverviewScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AdminOverviewDrawer(),
      body: Column(
        children: [
          AdminOverviewProfile(
            scaffoldKey: _scaffoldKey,
            isfromAdmin: true,
          ),
          VerticalSpace(height: 24.h),
          BodyPadding(child: AdminOverviewBody())
        ],
      ),
    );
  }
}
