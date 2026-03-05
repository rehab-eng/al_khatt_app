import 'package:flutter/material.dart';

import 'brand_header.dart';
import 'ops_chrome.dart';
import 'responsive_body.dart';
import 'rounded_sheet.dart';

class BrandScaffold extends StatelessWidget {
  const BrandScaffold({
    super.key,
    required this.headerTitle,
    this.headerSubtitle,
    this.headerIcon,
    required this.child,
  });

  final String headerTitle;
  final String? headerSubtitle;
  final IconData? headerIcon;
  final Widget child;

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
                          const OpsTopStrip(systemName: 'AL KHATT SYSTEM'),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(
                                12,
                                12,
                                12,
                                20,
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 920,
                                  ),
                                  child: Column(
                                    children: [
                                      BrandHeader(
                                        title: headerTitle,
                                        subtitle: headerSubtitle,
                                        icon: headerIcon,
                                      ),
                                      const SizedBox(height: 14),
                                      RoundedSheet(
                                        child: ResponsiveBody(
                                          maxWidth: 760,
                                          horizontalPadding: 0,
                                          child: child,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
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
