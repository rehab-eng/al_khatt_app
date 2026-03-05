import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isLoading) return;
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    final phone = _phoneController.text.trim();
    ref.read(authControllerProvider.notifier).setPendingPhone(phone.isEmpty ? '0000000000' : phone);
    if (_uiOnly) {
      if (mounted) {
        context.push(AppRoutes.otp);
        setState(() => _isLoading = false);
      }
      return;
    }
    await ref.read(authControllerProvider.notifier).requestOtp();
    if (mounted) {
      context.push(AppRoutes.otp);
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/alkhat/screens/sign_in_up_/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: -129,
                top: 327,
                width: 186.02,
                height: 325,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/sign_in_up_/assets/icons/arrows_side.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 0,
                top: 284,
                width: 486,
                height: 796,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(80)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(51),
                        blurRadius: 50,
                        spreadRadius: 7,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 302,
                width: 282,
                height: 135,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/sign_in_up_/assets/images/logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 54,
                top: 68,
                width: 378,
                child: _HeroTextBlock(),
              ),
              const Positioned(
                left: 254,
                top: 459,
                width: 200,
                child: _LabelText('رقم الهاتف'),
              ),
              Positioned(
                left: 31,
                top: 502,
                width: 307,
                height: 60,
                child: _SvgTextField(
                  controller: _phoneController,
                  keyboardType: _uiOnly ? TextInputType.text : TextInputType.phone,
                  validator: _uiOnly ? (_) => null : Validators.libyanPhone,
                  svgAsset: 'assets/alkhat/screens/sign_in_up_/assets/components/phone_number_InputField.svg',
                  contentPadding: EdgeInsets.only(right: 18, left: 18, top: 14),
                ),
              ),
              const Positioned(
                left: 350,
                top: 518,
                child: Text(
                  '+218',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFAA652B),
                  ),
                ),
              ),
              Positioned(
                left: 414,
                top: 517,
                width: 43,
                height: 31,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/sign_in_up_/assets/icons/twemoji_flag-libya.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 254,
                top: 580,
                width: 200,
                child: _LabelText('كلمة المرور'),
              ),
              Positioned(
                left: 31,
                top: 623,
                width: 426,
                height: 60,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/alkhat/screens/sign_in_up_/assets/components/password_InputField.svg',
                      fit: BoxFit.contain,
                      width: 426,
                      height: 60,
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18, left: 56, top: 14),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscure,
                          validator: _uiOnly ? (_) => null : Validators.password,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4E4E4E),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 15,
                      width: 34,
                      height: 29,
                      child: GestureDetector(
                        onTap: () => setState(() => _obscure = !_obscure),
                        child: SvgPicture.asset(
                          'assets/alkhat/screens/sign_in_up_/assets/icons/clarity_eye-hide-solid.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 167.5,
                top: 711,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFAA652B),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 763,
                width: 426,
                height: 68,
                child: GestureDetector(
                  onTap: _isLoading ? null : _submit,
                  child: Stack(
                    children: const [
                      Positioned.fill(
                        child: _ButtonSvg(
                          asset: 'assets/alkhat/screens/sign_in_up_/assets/components/signup_button.svg',
                        ),
                      ),
                      Center(
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34.83,
                top: 859,
                width: 416.35,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/sign_in_up_/assets/components/line.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 173,
                top: 876,
                child: Text(
                  'ليس لديك حساب؟',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4E4E4E),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 914,
                width: 426,
                height: 68,
                child: GestureDetector(
                  onTap: () => context.go(AppRoutes.roleSelect),
                  child: Stack(
                    children: const [
                      Positioned.fill(
                        child: _ButtonSvg(
                          asset: 'assets/alkhat/screens/sign_in_up_/assets/components/create_new_account_button.svg',
                        ),
                      ),
                      Center(
                        child: Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 1008,
                width: 426,
                child: Text(
                  'قواعد استخدام الخصوصية وقواعد الخصوصية\nجميع الحقوق محفوظة حصرياً لشركة خطوط الرمال',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFAA652B),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroTextBlock extends StatelessWidget {
  const _HeroTextBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text(
          'أطلق العنان للجيل التالي',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 4),
        Text(
          'من الإنشاءات والموارد المعمارية',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 6),
        Text(
          'تطبيق الخط هو إحدى خدمات شركة خطوط الرمال',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
        Text(
          'لربط خدمات المقاولين وسائقي الشاحنات والوكلاء',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
        Text(
          'المعماريّة ذات الشأن في الداخل الليبي.',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

class _LabelText extends StatelessWidget {
  const _LabelText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xFFAA652B),
      ),
    );
  }
}

class _SvgTextField extends StatelessWidget {
  const _SvgTextField({
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.svgAsset,
    required this.contentPadding,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final String svgAsset;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned.fill(
          child: Padding(
            padding: contentPadding,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              validator: validator,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4E4E4E),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ButtonSvg extends StatelessWidget {
  const _ButtonSvg({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      fit: BoxFit.contain,
    );
  }
}
