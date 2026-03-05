import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../domain/entities/wallet_summary.dart';
import '../controllers/wallet_controller.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(walletSummaryProvider);
    final formatter = NumberFormat.decimalPattern('ar');
    final walletData = summary.asData?.value;
    final balanceText = walletData == null
        ? '--'
        : '${formatter.format(walletData.wallet.balance)} ${walletData.wallet.currency}';

    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 34,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/menu_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 403,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/notification_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 26,
                top: 170,
                width: 435,
                height: 560,
                child: summary.when(
                  loading: () => const _WalletLoading(),
                  error: (_, _) => const _WalletEmpty(),
                  data: (data) => _WalletTransactions(data: data),
                ),
              ),
              const Positioned(
                left: 264,
                top: 723,
                width: 197,
                child: Text(
                  'المحفظة',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 730,
                width: 197,
                child: Text(
                  'شروط وأحكام رأس المال',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4E4E4E),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 766,
                width: 435,
                height: 139,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/vaultmoney_placement.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 365,
                top: 825,
                width: 75,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/material-symbols_wallet.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 243,
                top: 777,
                width: 197,
                child: Text(
                  'رأس المال:',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 777,
                width: 262,
                child: GestureDetector(
                  onTap: () => _showWithdrawSheet(context, ref),
                  child: const Text(
                    'عمليات سحب رأس المال >',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFAA652B),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 837,
                width: 274,
                child: Text(
                  balanceText,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 913.75,
                width: 197,
                child: Text(
                  'المحفظة مشفرة',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4E4E4E),
                  ),
                ),
              ),
              const Positioned(
                left: 264,
                top: 913.75,
                width: 197,
                child: Text(
                  'العرابين والدفع الثابت',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4E4E4E),
                  ),
                ),
              ),
              Positioned(
                left: 146,
                top: 914.25,
                width: 18,
                height: 22,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/material-symbols_encrypted-rounded.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showWithdrawSheet(BuildContext context, WidgetRef ref) async {
    final amountController = TextEditingController();
    final noteController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('طلب سحب رأس المال', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                AppTextField(
                  label: 'المبلغ',
                  hint: 'أدخل المبلغ',
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (value) => Validators.digitsOnly(value, label: 'المبلغ'),
                ),
                const SizedBox(height: 12),
                AppTextField(
                  label: 'ملاحظة (اختياري)',
                  hint: 'سبب السحب',
                  controller: noteController,
                ),
                const SizedBox(height: 16),
                AppButton(
                  label: 'إرسال الطلب',
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    final amount = double.tryParse(amountController.text.trim()) ?? 0;
                    await ref.read(walletActionsProvider).requestWithdrawal(
                          amount: amount,
                          note: noteController.text.trim().isEmpty ? null : noteController.text.trim(),
                        );
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WalletLoading extends StatelessWidget {
  const _WalletLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFFAA652B)),
    );
  }
}

class _WalletEmpty extends StatelessWidget {
  const _WalletEmpty();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لا توجد عمليات حتى الآن.',
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF4E4E4E),
        ),
      ),
    );
  }
}

class _WalletTransactions extends StatelessWidget {
  const _WalletTransactions({required this.data});

  final WalletSummary data;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern('ar');
    return ListView(
      children: [
        const Text(
          'سجل العمليات',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        if (data.transactions.isEmpty)
          const Text(
            'لا توجد عمليات حتى الآن.',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        else
          ...data.transactions.map(
            (tx) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TransactionCard(
                title: tx.description ?? 'عملية محفظة',
                amount: '${formatter.format(tx.amount)} ${data.wallet.currency}',
                date: DateFormat('yyyy/MM/dd').format(tx.createdAt),
                type: tx.type,
              ),
            ),
          ),
      ],
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });

  final String title;
  final String amount;
  final String date;
  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            right: 18,
            top: 18,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 18,
            top: 52,
            child: Text(
              'نوع العملية: $type',
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 20,
            child: Text(
              date,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 18,
            bottom: 20,
            child: Text(
              amount,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
