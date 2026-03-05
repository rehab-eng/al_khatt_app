import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, required this.title, this.subtitle, this.icon});

  final String title;
  final String? subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(
        gradient: AppGradients.header,
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          if (icon != null)
            Container(
              width: 44,
              height: 44,
              margin: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                color: AppColors.navyAlt,
                border: Border.all(color: AppColors.gold.withAlpha(130)),
              ),
              child: Icon(icon, color: AppColors.gold, size: 22),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    letterSpacing: 0.2,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondaryAlt,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(width: 24, height: 2, color: AppColors.gold),
        ],
      ),
    );
  }
}
