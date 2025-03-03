import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class ToolTagWidget extends StatelessWidget {
  final String text;

  const ToolTagWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFEFF7F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText(
        text: text,
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
    );
  }
}
