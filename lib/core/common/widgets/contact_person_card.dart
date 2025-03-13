import 'package:flutter/material.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';

class ContactPersonCard extends StatelessWidget {
  final String name;
  final String role;
  final String? avatarText;
  final Color? avatarColor;
  final String? avatarImage;
  final String phoneNumber;

  const ContactPersonCard({
    super.key,
    required this.name,
    required this.role,
    this.avatarText,
    this.avatarColor,
    this.avatarImage,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        if (avatarImage != null)
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(avatarImage!),
          )
        else
          CircleAvatar(
            radius: 20,
            backgroundColor: avatarColor ?? Colors.blue,
            child: Text(
              avatarText ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const SizedBox(width: 12),
        // Name and role
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Spacer(),
        // Call icon
        GestureDetector(
          onTap: () {
            AppHelperFunctions.makePhoneCall(phoneNumber);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0D8496),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.phone,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
