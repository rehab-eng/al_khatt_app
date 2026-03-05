import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/brand_scaffold.dart';
import '../../../../core/widgets/step_indicator.dart';

class VehicleInfoPage extends StatefulWidget {
  const VehicleInfoPage({super.key});

  @override
  State<VehicleInfoPage> createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();
  final _registrationReasonController = TextEditingController();
  final _vehicleNameController = TextEditingController();
  final _plateNumberController = TextEditingController();
  final _trailerNumberController = TextEditingController();
  final _maxLoadController = TextEditingController();
  bool _registered = true;
  String? _vehicleType;

  @override
  void dispose() {
    _registrationReasonController.dispose();
    _vehicleNameController.dispose();
    _plateNumberController.dispose();
    _trailerNumberController.dispose();
    _maxLoadController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    context.go(AppRoutes.createPassword);
  }

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      headerTitle: 'معلومات المركبة',
      headerSubtitle: 'أدخل معلومات المركبة للمتابعة',
      headerIcon: Icons.local_shipping,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('هل المركبة مسجلة بإسمك؟', textAlign: TextAlign.right),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: [
                ChoiceChip(
                  label: const Text('نعم'),
                  selected: _registered,
                  onSelected: (_) => setState(() => _registered = true),
                ),
                ChoiceChip(
                  label: const Text('لا'),
                  selected: !_registered,
                  onSelected: (_) => setState(() => _registered = false),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!_registered)
              AppTextField(
                label: 'سبب عدم التسجيل بإسمك',
                hint: 'وضح السبب',
                controller: _registrationReasonController,
                validator: (value) => Validators.requiredField(value, label: 'سبب عدم التسجيل'),
              ),
            if (!_registered) const SizedBox(height: 14),
            AppTextField(
              label: 'اسم المركبة (إن وجد)',
              hint: 'أدخل اسم المركبة',
              controller: _vehicleNameController,
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'رقم اللوحة',
              hint: 'أدخل رقم اللوحة',
              controller: _plateNumberController,
              validator: (value) => Validators.requiredField(value, label: 'رقم اللوحة'),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: _vehicleType,
              decoration: const InputDecoration(labelText: 'نوع المركبة'),
              items: const [
                DropdownMenuItem(value: 'truck_small', child: Text('شاحنة صغيرة')),
                DropdownMenuItem(value: 'truck_medium', child: Text('شاحنة متوسطة')),
                DropdownMenuItem(value: 'truck_large', child: Text('شاحنة كبيرة')),
              ],
              validator: (value) => value == null ? 'يرجى تحديد نوع المركبة' : null,
              onChanged: (value) => setState(() => _vehicleType = value),
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'رقم المقطورة (اختياري)',
              hint: 'أدخل رقم المقطورة',
              controller: _trailerNumberController,
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'الحمولة القصوى (اختياري)',
              hint: 'حدد الحمولة',
              controller: _maxLoadController,
              keyboardType: TextInputType.number,
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
