import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.maxLines = 1,
    this.radius,
    this.prefixIcon,
    this.onChange,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.isPhoneField = false,
    this.numberOnly = false,
    this.keyboardType,
    this.onSubmit,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final bool isPassword;
  final int maxLines;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String value)? onChange;
  final Function(String value)? onSubmit;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool isPhoneField;
  final bool numberOnly;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmit,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      obscuringCharacter: "*",
      keyboardType: widget.keyboardType,
      style: GoogleFonts.figtree(color: AppColors.black),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: AppColors.white,
        labelStyle: GoogleFonts.figtree(color: AppColors.grey),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.figtree(color: Color(0xFF7A9599)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 8)),
          borderSide: BorderSide(color: Color(0xFFE2E2E6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 8)),
          borderSide: BorderSide(color: Color(0xFFE2E2E6), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 8)),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 8)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 8)),
          borderSide: BorderSide(color: Colors.orange),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Color(0xFF262B2B),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
      inputFormatters: widget.numberOnly
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
    );
  }
}
