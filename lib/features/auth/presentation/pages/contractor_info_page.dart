import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/brand_scaffold.dart';
import '../../../../core/widgets/step_indicator.dart';

class ContractorInfoPage extends StatefulWidget {
  const ContractorInfoPage({super.key});

  @override
  State<ContractorInfoPage> createState() => _ContractorInfoPageState();
}

class _ContractorInfoPageState extends State<ContractorInfoPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();
  bool _isDriver = false;

  void _submit() {
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    context.go(AppRoutes.createPassword);
  }

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      headerTitle: 'معلومات المقاول',
      headerSubtitle: 'أدخل معلومات المقاول للمتابعة',
      headerIcon: Icons.business_center_outlined,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: 'اسم المقاول أو الشركة',
              hint: 'أدخل الاسم كما هو في السجل التجاري',
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
              hint: 'أدخل رقم الرخصة',
              keyboardType: TextInputType.number,
              validator: (value) => Validators.digitsOnly(value, label: 'رقم الرخصة'),
            ),
            const SizedBox(height: 14),
            const Text('هل أنت سائق شاحنة بجانب كونك مقاول؟', textAlign: TextAlign.right),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: [
                ChoiceChip(
                  label: const Text('نعم'),
                  selected: _isDriver,
                  onSelected: (_) => setState(() => _isDriver = true),
                ),
                ChoiceChip(
                  label: const Text('لا'),
                  selected: !_isDriver,
                  onSelected: (_) => setState(() => _isDriver = false),
                ),
              ],
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
