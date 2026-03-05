import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/design_canvas.dart';
import '../../domain/entities/orders_summary.dart';
import '../controllers/orders_controller.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersSummaryProvider);
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/alkhat/screens/orders_driver_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 34,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/orders_driver_ui/assets/icons/menu_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 403,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/orders_driver_ui/assets/icons/notification_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 190,
                top: 40,
                child: Text(
                  'الطلبيات',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 515,
                width: 435,
                height: 60,
                child: _SearchBox(),
              ),
              Positioned(
                left: 26,
                top: 590,
                width: 435,
                height: 430,
                child: orders.when(
                  loading: () => const _OrdersLoading(),
                  error: (_, _) => const _OrdersEmpty(),
                  data: (data) => _OrdersList(data: data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/alkhat/screens/orders_driver_ui/assets/components/search_box.svg',
          fit: BoxFit.contain,
        ),
        const Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ابحث عن طلب...',
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  color: Color(0xFFB7B7B7),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OrdersLoading extends StatelessWidget {
  const _OrdersLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFFAA652B)),
    );
  }
}

class _OrdersEmpty extends StatelessWidget {
  const _OrdersEmpty();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لا توجد طلبات حالياً.',
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  const _OrdersList({required this.data});

  final OrdersSummary data;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('0.##');
    final items = <Widget>[
      const Text(
        'الطلبيات الحالية',
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 12),
      if (data.current.isEmpty)
        const Text(
          'لا توجد طلبيات حالية.',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )
      else
        ...data.current.map((order) => _OrderCard(order: order, formatter: formatter)),
      const SizedBox(height: 16),
      const Text(
        'الطلبيات الناجحة',
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 12),
      if (data.completed.isEmpty)
        const Text(
          'لا توجد طلبيات ناجحة بعد.',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )
      else
        ...data.completed.map((order) => _OrderCard(order: order, formatter: formatter)),
      const SizedBox(height: 12),
    ];

    return ListView(
      children: items,
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order, required this.formatter});

  final OrderItem order;
  final NumberFormat formatter;

  String _materialIcon(String material) {
    final normalized = material.toLowerCase();
    if (normalized.contains('رخام') || normalized.contains('marble')) {
      return 'assets/alkhat/screens/orders_driver_ui/assets/icons/order_icon.svg';
    }
    if (normalized.contains('رمل') || normalized.contains('رملة') || normalized.contains('sand')) {
      return 'assets/alkhat/screens/orders_driver_ui/assets/icons/checkorder_button_small.svg';
    }
    return 'assets/alkhat/screens/orders_driver_ui/assets/icons/order_icon.svg';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: 435,
        height: 181,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/alkhat/screens/orders_driver_ui/assets/components/order_overview_box.svg',
              width: 435,
              height: 181,
              fit: BoxFit.contain,
            ),
            Positioned(
              left: 18,
              top: 18,
              width: 44,
              height: 44,
              child: SvgPicture.asset(
                _materialIcon(order.material),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              right: 18,
              top: 18,
              child: Text(
                order.material,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const Positioned(
              right: 18,
              top: 46,
              child: Text(
                'متابعة الطلبية',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 18,
              top: 72,
              child: Text(
                'رقم الطلبية: ${order.id}',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 18,
              top: 92,
              child: Text(
                'الكمية: ${formatter.format(order.quantityM3)} م³',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 18,
              bottom: 20,
              child: Text(
                DateFormat('yyyy/MM/dd').format(order.createdAt),
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 18,
              bottom: 20,
              child: Text(
                '${order.origin ?? '-'} → ${order.destination ?? '-'}',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
