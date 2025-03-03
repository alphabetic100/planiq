// Helper Widgets
import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class ChecklistItemWidget extends StatelessWidget {
  final String text;
  final bool isCompleted;

  const ChecklistItemWidget({
    super.key,
    required this.text,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              isCompleted ? Icons.check_circle_outline : Icons.circle_outlined,
              color: isCompleted ? Colors.green : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 12),
            CustomText(
              text: text,
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
