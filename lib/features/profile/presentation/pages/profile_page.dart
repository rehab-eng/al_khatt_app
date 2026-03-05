import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/design_canvas.dart';
import '../../domain/entities/profile_data.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
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
              const Positioned(
                left: 176,
                top: 40,
                child: Text(
                  'الملف الشخصي',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 120,
                width: 435,
                height: 900,
                child: profile.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Color(0xFFAA652B)),
                  ),
                  error: (_, _) => const Center(
                    child: Text(
                      'لا تتوفر بيانات للحساب حالياً.',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  data: (data) => _ProfileContent(data: data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.data});

  final ProfileData data;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern('ar');
    final joined = DateFormat('yyyy/MM/dd').format(data.dateJoined);
    final licenseNumber = data.contractorProfile?.licenseNumber ??
        data.agentProfile?.licenseNumber ??
        data.driverProfile?.licenseNumber;
    final licenseStatus = data.contractorProfile?.licenseStatus ??
        data.agentProfile?.licenseStatus ??
        data.driverProfile?.licenseStatus;

    return ListView(
      children: [
        _ProfileField(
          asset: 'assets/alkhat/screens/account_driver_ui/assets/components/username_place.svg',
          label: 'اسم المستخدم:',
          value: data.fullName.isNotEmpty ? data.fullName : data.phone,
        ),
        const SizedBox(height: 14),
        _ProfileField(
          asset: 'assets/alkhat/screens/account_driver_ui/assets/components/phonenumber_placement.svg',
          label: 'رقم الهاتف:',
          value: data.phone.isNotEmpty ? data.phone : '-',
        ),
        const SizedBox(height: 14),
        _ProfileField(
          asset: 'assets/alkhat/screens/account_driver_ui/assets/components/accountnumber_placement.svg',
          label: 'رقم حساب:',
          value: data.id,
        ),
        const SizedBox(height: 14),
        if (licenseNumber != null)
          _ProfileField(
            asset: 'assets/alkhat/screens/account_driver_ui/assets/components/roads_placement.svg',
            label: 'رقم رخصة:',
            value: licenseNumber,
            status: licenseStatus,
          ),
        if (licenseNumber != null) const SizedBox(height: 14),
        if (data.primaryTruckPlate != null)
          _ProfileField(
            asset: 'assets/alkhat/screens/account_driver_ui/assets/components/platenumb_placement.svg',
            label: 'رقم اللوحة:',
            value: data.primaryTruckPlate!,
          ),
        if (data.primaryTruckPlate != null) const SizedBox(height: 14),
        if (data.vehicleType != null)
          _ProfileField(
            asset: 'assets/alkhat/screens/account_driver_ui/assets/components/vechname_placement.svg',
            label: 'نوع المركبة:',
            value: data.vehicleType!,
          ),
        if (data.vehicleType != null) const SizedBox(height: 14),
        _ProfileField(
          asset: 'assets/alkhat/screens/account_driver_ui/assets/components/vechpla_placement.svg',
          label: 'عضو منذ:',
          value: joined,
        ),
        const SizedBox(height: 14),
        _ProfileField(
          asset: 'assets/alkhat/screens/account_driver_ui/assets/components/roads_placement.svg',
          label: 'عدد الرحلات:',
          value: data.tripsCount.toString(),
        ),
        const SizedBox(height: 14),
        _ProfileField(
          asset: 'assets/alkhat/screens/account_driver_ui/assets/components/vaultmoney_placement.svg',
          label: 'رصيد المحفظة:',
          value: '${formatter.format(data.walletBalance)} ${data.walletCurrency}',
          tall: true,
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/alkhat/screens/account_driver_ui/assets/components/editaccount_button.svg',
                width: 205,
                height: 52,
                fit: BoxFit.contain,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/alkhat/screens/account_driver_ui/assets/components/shareaccount_button.svg',
                width: 205,
                height: 52,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.asset,
    required this.label,
    required this.value,
    this.status,
    this.tall = false,
  });

  final String asset;
  final String label;
  final String value;
  final String? status;
  final bool tall;

  String _statusLabel(String status) {
    final normalized = status.toLowerCase();
    if (normalized == 'approved') return 'تم الاعتماد';
    if (normalized == 'rejected') return 'مرفوض';
    return 'قيد المراجعة';
  }

  Color _statusColor(String status) {
    final normalized = status.toLowerCase();
    if (normalized == 'approved') return Colors.green;
    if (normalized == 'rejected') return Colors.red;
    return const Color(0xFFAA652B);
  }

  @override
  Widget build(BuildContext context) {
    final fieldHeight = tall ? 139.0 : 60.0;
    return SizedBox(
      width: 435,
      height: fieldHeight,
      child: Stack(
        children: [
          SvgPicture.asset(
            asset,
            width: 435,
            height: fieldHeight,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                textDirection: ui.TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      value,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4E4E4E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (status != null)
            Positioned(
              left: 18,
              top: 10,
              child: Text(
                _statusLabel(status!),
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: _statusColor(status!),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
