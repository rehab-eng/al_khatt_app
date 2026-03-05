import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

enum AppButtonVariant { primary, secondary, danger }

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isPrimary = true,
    this.variant,
    this.icon,
    this.fullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isPrimary;
  final AppButtonVariant? variant;
  final IconData? icon;
  final bool fullWidth;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovering = false;

  AppButtonVariant get _resolvedVariant {
    if (widget.variant != null) return widget.variant!;
    return widget.isPrimary
        ? AppButtonVariant.primary
        : AppButtonVariant.secondary;
  }

  @override
  Widget build(BuildContext context) {
    final variant = _resolvedVariant;
    final disabled = widget.isLoading || widget.onPressed == null;

    final backgroundColor = switch (variant) {
      AppButtonVariant.primary => AppColors.gold,
      AppButtonVariant.secondary =>
        _isHovering ? AppColors.gold.withAlpha(32) : Colors.transparent,
      AppButtonVariant.danger => AppColors.danger,
    };

    final foregroundColor = switch (variant) {
      AppButtonVariant.primary => AppColors.navyAlt,
      AppButtonVariant.secondary => AppColors.gold,
      AppButtonVariant.danger => AppColors.textPrimary,
    };

    final borderColor = switch (variant) {
      AppButtonVariant.primary => AppColors.gold,
      AppButtonVariant.secondary =>
        _isHovering ? AppColors.sand : AppColors.gold,
      AppButtonVariant.danger => AppColors.danger,
    };

    final content = widget.isLoading
        ? SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(widget.label),
            ],
          );

    Widget button = MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: disabled ? AppColors.slate : backgroundColor,
          border: Border.all(color: disabled ? AppColors.border : borderColor),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovering && !disabled
              ? AppShadows.focus
              : AppShadows.card,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: disabled ? null : widget.onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              child: DefaultTextStyle(
                style:
                    Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: disabled
                          ? AppColors.textSecondary
                          : foregroundColor,
                    ) ??
                    TextStyle(color: foregroundColor),
                child: IconTheme(
                  data: IconThemeData(
                    color: disabled ? AppColors.textSecondary : foregroundColor,
                  ),
                  child: Center(child: content),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.fullWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
