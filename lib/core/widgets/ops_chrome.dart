import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_theme.dart';

class OpsBackground extends StatelessWidget {
  const OpsBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppGradients.background),
      child: Stack(
        children: [
          const Positioned(
            top: -140,
            right: -120,
            child: _GlowOrb(color: Color(0x55D4AF37), size: 320),
          ),
          const Positioned(
            bottom: -170,
            left: -120,
            child: _GlowOrb(color: Color(0x30F3E2A2), size: 340),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.gold.withAlpha(12)],
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class OpsTopStrip extends StatefulWidget {
  const OpsTopStrip({
    super.key,
    this.systemName = 'AL KHATT OPS',
    this.connectionLabel = 'متصل',
  });

  final String systemName;
  final String connectionLabel;

  @override
  State<OpsTopStrip> createState() => _OpsTopStripState();
}

class _OpsTopStripState extends State<OpsTopStrip> {
  late DateTime _now;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('HH:mm:ss').format(_now);
    final date = DateFormat('yyyy/MM/dd').format(_now);

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.surface.withAlpha(240),
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          _StripBadge(label: widget.systemName, icon: Icons.shield_outlined),
          const SizedBox(width: 10),
          _StripBadge(
            label: widget.connectionLabel,
            icon: Icons.circle,
            color: AppColors.success,
          ),
          const Spacer(),
          Text(
            '$date  |  $time',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textSecondaryAlt,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class OpsSidebar extends StatelessWidget {
  const OpsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <IconData>[
      Icons.dashboard_outlined,
      Icons.inventory_2_outlined,
      Icons.local_shipping_outlined,
      Icons.payments_outlined,
      Icons.forum_outlined,
      Icons.person_outline,
    ];

    return Container(
      width: 86,
      margin: const EdgeInsets.fromLTRB(12, 12, 0, 12),
      decoration: BoxDecoration(
        color: AppColors.surface.withAlpha(245),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          const SizedBox(height: 14),
          Container(width: 40, height: 2, color: AppColors.gold),
          const SizedBox(height: 18),
          for (final icon in items) ...[
            _SideIcon(icon: icon),
            const SizedBox(height: 10),
          ],
          const Spacer(),
          Text(
            'RTL',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 1.6,
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

class _StripBadge extends StatelessWidget {
  const _StripBadge({required this.label, required this.icon, this.color});

  final String label;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? AppColors.gold;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        color: AppColors.surfaceElevated,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textPrimary,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _SideIcon extends StatelessWidget {
  const _SideIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          color: AppColors.surfaceElevated,
        ),
        child: Icon(icon, color: AppColors.slate, size: 22),
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, Colors.transparent]),
        ),
      ),
    );
  }
}
