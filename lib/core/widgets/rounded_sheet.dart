import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class RoundedSheet extends StatelessWidget {
  const RoundedSheet({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.card,
      ),
      child: child,
    );
  }
}
