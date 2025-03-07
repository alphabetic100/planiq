import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminNotificationCard extends StatelessWidget {
  final String taskId;
  final String userId;
  final DateTime date;
  final VoidCallback? onTap;

  const AdminNotificationCard({
    super.key,
    required this.taskId,
    required this.userId,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bell icon in a light green circle
            Container(
              width: 48.0,
              height: 48.0,
              decoration: const BoxDecoration(
                color: Color(0xFFF0FFF0), // Light green background
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.notifications_active,
                  color: Color(0xFF22C55E), // Green bell icon
                  size: 28.0,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Task assignment accepted',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat('MMM d, yyyy').format(date),
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF64748B), // Slate gray color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Color(0xFF64748B), // Slate gray color
                      ),
                      children: [
                        const TextSpan(text: 'Task #'),
                        TextSpan(text: taskId),
                        const TextSpan(text: ' has been accepted by User ID: '),
                        TextSpan(text: userId),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
