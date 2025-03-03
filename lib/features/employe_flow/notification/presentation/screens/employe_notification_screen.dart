import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/notification/presentation/components/notification_card.dart';

class EmployeNotificationScreen extends StatelessWidget {
  const EmployeNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appbarHeight: 70.h,
          title: "Notification",
        ),
        body: SingleChildScrollView(
          child: BodyPadding(
            child: Column(
              children: [
                VerticalSpace(height: 20.h),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.0.h),
                        child: NotificationCard(
                          catagory: 'general',
                          title: "Congratulations, David!",
                          subtitle:
                              "We've received your issue report for “Job ID: #1234567”. The admin team will review it and get back to you soon. Stay tuned!",
                          date: "Dec 08, 2024",
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
