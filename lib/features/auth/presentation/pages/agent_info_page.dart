import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/brand_scaffold.dart';
import '../../../../core/widgets/step_indicator.dart';

class AgentInfoPage extends StatefulWidget {
  const AgentInfoPage({super.key});

  @override
  State<AgentInfoPage> createState() => _AgentInfoPageState();
}

class _AgentInfoPageState extends State<AgentInfoPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    context.go(AppRoutes.createPassword);
  }

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      headerTitle: 'معلومات الوكيل',
      headerSubtitle: 'أدخل معلومات الوكيل للمتابعة',
      headerIcon: Icons.support_agent,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: 'اسم الشركة',
              hint: 'أدخل اسم الشركة كما هو في السجل التجاري',
              validator: (value) => Validators.requiredField(value, label: 'اسم الشركة'),
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
              label: 'رقم الرخصة التجارية',
              hint: 'أدخل رقم الرخصة التجارية',
              keyboardType: TextInputType.number,
              validator: (value) => Validators.digitsOnly(value, label: 'رقم الرخصة التجارية'),
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'المجال التجاري',
              hint: 'حدد مجال العمل',
              validator: (value) => Validators.requiredField(value, label: 'المجال التجاري'),
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'مقر الشركة',
              hint: 'أدخل العنوان',
              validator: (value) => Validators.requiredField(value, label: 'العنوان'),
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
