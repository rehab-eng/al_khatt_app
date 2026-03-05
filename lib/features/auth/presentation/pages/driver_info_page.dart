import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/brand_scaffold.dart';
import '../../../../core/widgets/step_indicator.dart';

class DriverInfoPage extends StatefulWidget {
  const DriverInfoPage({super.key});

  @override
  State<DriverInfoPage> createState() => _DriverInfoPageState();
}

class _DriverInfoPageState extends State<DriverInfoPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    context.go(AppRoutes.vehicleInfo);
  }

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      headerTitle: 'معلومات السائق',
      headerSubtitle: 'أدخل معلومات السائق للمتابعة',
      headerIcon: Icons.local_shipping_outlined,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: 'اسم السائق',
              hint: 'أدخل اسم السائق',
              validator: (value) => Validators.requiredField(value, label: 'اسم السائق'),
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'رقم الهاتف',
              hint: '+218XXXXXXXXX',
              keyboardType: TextInputType.phone,
              validator: Validators.libyanPhone,
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'رقم رخصة القيادة',
              hint: 'أدخل رقم الرخصة',
              keyboardType: TextInputType.number,
              validator: (value) => Validators.digitsOnly(value, label: 'رقم الرخصة'),
            ),
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload_file_outlined),
              label: const Text('رفع صورة من رخصة القيادة'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.photo_camera_outlined),
              label: const Text('التقاط صورة عبر الكاميرا'),
            ),
            const SizedBox(height: 20),
            const StepIndicator(current: 2, total: 4),
            const SizedBox(height: 20),
            AppButton(label: 'المتابعة', onPressed: _submit),
          ],
        ),
      ),
    );
  }
}
