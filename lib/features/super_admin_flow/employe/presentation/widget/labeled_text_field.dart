import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/custom_text_field.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.validator,
  });
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final bool readOnly;
  final Function()? onTap;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff526366),
              ),
            ),
          ),
          HorizontalSpace(width: 8.w),
          Expanded(
            child: CustomTextField(
              controller: controller,
              onChange: onChanged,
              isPassword: obscureText,
              onTap: onTap,
              readOnly: readOnly,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
