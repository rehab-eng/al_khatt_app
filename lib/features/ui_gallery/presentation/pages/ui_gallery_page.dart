import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_scaffold.dart';

class UiGalleryPage extends StatelessWidget {
  const UiGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appPages = [
      _GalleryItem(
        title: 'لوحة الرسائل',
        subtitle: 'واجهة منظمة بالنظام الجديد',
        route: AppRoutes.messages,
        isModern: true,
      ),
      _GalleryItem(
        title: 'مواد المقاول',
        subtitle: 'شاشات العمليات الجديدة',
        route: AppRoutes.contractorHome,
        isModern: true,
      ),
      _GalleryItem(
        title: 'طلبات السائق',
        subtitle: 'نمط داكن + ذهبي',
        route: AppRoutes.driverHome,
        isModern: true,
      ),
      _GalleryItem(
        title: 'عمليات الوكيل',
        subtitle: 'هيكل Sidebar وTop Strip',
        route: AppRoutes.agentHome,
        isModern: true,
      ),
      _GalleryItem(
        title: 'بيانات السائق',
        subtitle: 'نماذج ثيم موحد',
        route: AppRoutes.driverInfo,
        isModern: true,
      ),
      _GalleryItem(
        title: 'المركبة',
        subtitle: 'نموذج CRUD متوافق مع الثيم',
        route: AppRoutes.vehicleInfo,
        isModern: true,
      ),
    ];

    const legacyPages = [
      _GalleryItem(
        title: 'Login القديم',
        subtitle: 'تصميم ثابت SVG قديم',
        route: AppRoutes.login,
        isModern: false,
      ),
      _GalleryItem(
        title: 'Role Selection القديم',
        subtitle: 'تصميم ثابت SVG قديم',
        route: AppRoutes.roleSelect,
        isModern: false,
      ),
      _GalleryItem(
        title: 'Orders القديم',
        subtitle: 'DesignCanvas ثابت',
        route: AppRoutes.orders,
        isModern: false,
      ),
      _GalleryItem(
        title: 'Wallet القديم',
        subtitle: 'DesignCanvas ثابت',
        route: AppRoutes.wallet,
        isModern: false,
      ),
      _GalleryItem(
        title: 'Profile القديم',
        subtitle: 'DesignCanvas ثابت',
        route: AppRoutes.profile,
        isModern: false,
      ),
      _GalleryItem(
        title: 'شاشات UI Generated',
        subtitle: 'نماذج مستوردة قديمة',
        route: AppRoutes.uiHome,
        isModern: false,
      ),
    ];

    return GlassScaffold(
      title: 'مركز التحكم البصري',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: ListView(
              children: const [
                _HeroBanner(),
                SizedBox(height: 14),
                _SectionTitle(
                  title: 'واجهات المنظومة الجديدة',
                  subtitle: 'الذهبي الملكي + الأبيض + التنظيم الهندسي',
                  isModern: true,
                ),
                SizedBox(height: 8),
                _RoutesGrid(items: appPages),
                SizedBox(height: 18),
                _SectionTitle(
                  title: 'واجهات قديمة (Legacy)',
                  subtitle:
                      'هذه الشاشات ما زالت بالنمط السابق ولم تُعاد هيكلتها بعد',
                  isModern: false,
                ),
                SizedBox(height: 8),
                _RoutesGrid(items: legacyPages),
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryItem {
  const _GalleryItem({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.isModern,
  });

  final String title;
  final String subtitle;
  final String route;
  final bool isModern;
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        border: Border.all(color: AppColors.gold.withAlpha(160)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Golden Sands Activated',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.sand,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'إذا دخلت قسم Legacy سيظهر الشكل القديم. لمشاهدة التنظيم الجديد اختر أي بطاقة من القسم الأول.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.subtitle,
    required this.isModern,
  });

  final String title;
  final String subtitle;
  final bool isModern;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: isModern ? AppColors.sand : AppColors.textSecondaryAlt,
                ),
              ),
              const SizedBox(height: 2),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: isModern ? AppColors.gold : AppColors.danger,
            ),
            color: (isModern ? AppColors.gold : AppColors.danger).withAlpha(30),
          ),
          child: Text(
            isModern ? 'NEW' : 'OLD',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isModern ? AppColors.sand : AppColors.danger,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _RoutesGrid extends StatelessWidget {
  const _RoutesGrid({required this.items});

  final List<_GalleryItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final twoColumns = constraints.maxWidth > 680;
        final cardWidth = twoColumns
            ? (constraints.maxWidth - 10) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final item in items)
              SizedBox(
                width: cardWidth,
                child: _RouteCard(item: item),
              ),
          ],
        );
      },
    );
  }
}

class _RouteCard extends StatelessWidget {
  const _RouteCard({required this.item});

  final _GalleryItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(item.route),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(
            color: item.isModern ? AppColors.border : AppColors.slate,
          ),
          boxShadow: AppShadows.card,
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: item.isModern
                    ? AppColors.gold.withAlpha(36)
                    : AppColors.slateAlt,
                border: Border.all(
                  color: item.isModern ? AppColors.gold : AppColors.border,
                ),
              ),
              child: Icon(
                item.isModern
                    ? Icons.dashboard_customize_outlined
                    : Icons.history_toggle_off,
                size: 18,
                color: item.isModern ? AppColors.gold : AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondaryAlt),
          ],
        ),
      ),
    );
  }
}
