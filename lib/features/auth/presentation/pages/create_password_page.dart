import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/brand_scaffold.dart';
import '../../../../core/widgets/step_indicator.dart';
import '../../domain/entities/app_user.dart';
import '../controllers/auth_controller.dart';

class CreatePasswordPage extends ConsumerStatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  ConsumerState<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends ConsumerState<CreatePasswordPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    final role = ref.read(authControllerProvider).selectedRole ?? UserRole.contractor;
    if (_uiOnly) {
      ref.read(authControllerProvider.notifier).signInAs(role);
    } else {
      ref.read(authControllerProvider.notifier).completeOnboarding();
    }
    context.go(
      role == UserRole.contractor
          ? AppRoutes.contractorHome
          : role == UserRole.driver
              ? AppRoutes.driverHome
              : AppRoutes.agentHome,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      headerTitle: 'كلمة المرور',
      headerSubtitle: 'آخر خطوات إنشاء الحساب',
      headerIcon: Icons.lock_outline,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            AppTextField(
              label: 'كلمة المرور',
              hint: 'أدخل كلمة المرور',
              controller: _passwordController,
              obscureText: _obscure,
              validator: _uiOnly ? null : Validators.password,
              suffix: IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'أعد كتابة كلمة المرور',
              hint: 'أدخل كلمة المرور مرة أخرى',
              controller: _confirmController,
              obscureText: _obscure,
              validator: _uiOnly
                  ? null
                  : (value) {
                final error = Validators.password(value);
                if (error != null) return error;
                if (value != _passwordController.text) {
                  return 'كلمتا المرور غير متطابقتين';
                }
                return null;
              },
              suffix: IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'معلومة: يفضّل أن تحتوي كلمة المرور على أرقام ورموز.',
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            const StepIndicator(current: 3, total: 4),
            const SizedBox(height: 20),
            AppButton(label: 'المتابعة', onPressed: _submit),
          ],
        ),
      ),
    );
  }
}
