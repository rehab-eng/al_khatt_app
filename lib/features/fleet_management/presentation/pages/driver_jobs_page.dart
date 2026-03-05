import 'package:flutter/material.dart';

import '../../../../core/widgets/glass_scaffold.dart';
import '../../../../core/widgets/responsive_body.dart';
import '../../../../core/widgets/shimmer.dart';

class DriverJobsPage extends StatelessWidget {
  const DriverJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(
      title: 'طلبات السائق',
      child: ResponsiveBody(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                'طلبات مناسبة لسعة الشاحنة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              ShimmerBox(height: 72),
              SizedBox(height: 12),
              ShimmerBox(height: 72),
            ],
          ),
        ),
      ),
    );
  }
}


