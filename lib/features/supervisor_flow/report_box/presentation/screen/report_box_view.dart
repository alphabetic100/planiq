import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/supervisor_flow/report_box/presentation/widget/report_view_card.dart';

class ReportBoxView extends StatelessWidget {
  const ReportBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Report Box",
        backButton: true,
      ),
      body: BodyPadding(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: ReportViewCard(),
            );
          },
        ),
      ),
    );
  }
}
