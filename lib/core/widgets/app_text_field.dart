import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.textInputAction,
    this.maxLines = 1,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        textAlign: TextAlign.right,
        textInputAction: textInputAction,
        maxLines: obscureText ? 1 : maxLines,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: IconTheme(
                    data: const IconThemeData(color: AppColors.gold),
                    child: prefixIcon!,
                  ),
                ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
