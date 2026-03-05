import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'ops_chrome.dart';

class GlassScaffold extends StatelessWidget {
  const GlassScaffold({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.showAppBar = true,
  });

  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpsBackground(
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final showSidebar = constraints.maxWidth >= 1024;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (showSidebar) const OpsSidebar(),
                    Expanded(
                      child: Column(
                        children: [
                          const OpsTopStrip(systemName: 'AL KHATT OPS'),
                          if (showAppBar)
                            _PanelHeader(title: title ?? '', actions: actions),
                          Expanded(child: child),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader({required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface.withAlpha(240),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          if (actions != null) ...actions!,
          if (actions != null && actions!.isNotEmpty) const Spacer(),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
