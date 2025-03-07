import 'package:flutter/material.dart';
import 'package:planiq/features/super_admin_flow/notification/presentation/widget/admin_notification_card.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return AdminNotificationCard(
                taskId: '123546',
                userId: '12535',
                date: DateTime.now(),
                onTap: () {
                  print('Another notification tapped');
                },
              );
            })
      ],
    ));
  }
}
