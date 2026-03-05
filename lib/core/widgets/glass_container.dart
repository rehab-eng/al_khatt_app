import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.blur = 0,
    this.opacity = 0.9,
  });

  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double blur;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: AppGradients.glass,
        color: AppColors.surface.withAlpha((opacity * 255).round()),
        borderRadius: borderRadius,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.card,
      ),
      child: child,
    );

    if (blur <= 0) {
      return ClipRRect(borderRadius: borderRadius, child: container);
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: container,
      ),
    );
  }
}
