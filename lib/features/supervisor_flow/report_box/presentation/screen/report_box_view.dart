import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/supervisor_flow/report_box/controller/report_box_controller.dart';
import 'package:planiq/features/supervisor_flow/report_box/presentation/widget/report_view_card.dart';

class ReportBoxView extends StatelessWidget {
  ReportBoxView({super.key});
  final ReportBoxController reportBoxController =
      Get.put(ReportBoxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Report Box",
        backButton: true,
      ),
      body: BodyPadding(child: Obx(() {
        final reports = reportBoxController.reporst.value;
        if (reports == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (reports.data.data.isEmpty) {
          return Center(
            child: Text("No Reports Found"),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: reports.data.data.length,
            itemBuilder: (context, index) {
              final report = reports.data.data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: ReportViewCard(
                  report: report,
                ),
              );
            },
          );
        }
      })),
    );
  }
}
