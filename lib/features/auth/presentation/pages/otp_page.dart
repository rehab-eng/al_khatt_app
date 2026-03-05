import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../controllers/auth_controller.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  static const bool _uiOnly = true;
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool _isLoading = false;

  static const _titleStyle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static const _whiteEmphasis = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static const _whiteRegular = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const _darkTitle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const _bodyText = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color(0xFF4E4E4E),
  );

  static const _mutedBody = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color(0x80000000),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isLoading) return;
    if (!_uiOnly && !_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    if (_uiOnly) {
      if (mounted) {
        setState(() => _isLoading = false);
        context.go(AppRoutes.createPassword);
      }
      return;
    }
    final session = await ref.read(authControllerProvider.notifier).verifyOtp(code: _controller.text.trim());
    if (mounted) {
      setState(() => _isLoading = false);
    }
    if (session != null && mounted) {
      context.go(AppRoutes.createPassword);
    }
  }

  Future<void> _resend() async {
    if (_uiOnly) return;
    await ref.read(authControllerProvider.notifier).requestOtp();
  }

  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: 67,
      height: 67,
      textStyle: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4E4E4E),
      ),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
    );

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
                    'assets/alkhat/screens/otp_section/assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 423.5,
                  top: 20,
                  width: 42,
                  height: 41,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: SvgPicture.asset(
                      'assets/alkhat/screens/otp_section/assets/icons/ic_round-arrow-back.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Positioned(
                  left: 141,
                  top: 26.17,
                  child: Text('التحقق من الهوية', style: _titleStyle),
                ),
                const Positioned(
                  left: 55.5,
                  top: 206.97,
                  child: Text('أرسلنا رمز التحقق على رقم الهاتف', style: _whiteEmphasis),
                ),
                const Positioned(
                  left: 42,
                  top: 242,
                  width: 402,
                  child: Text(
                    'أدخل الرمز الذي وصلكم على رقم هاتفكم',
                    textAlign: TextAlign.center,
                    style: _whiteRegular,
                  ),
                ),
                const Positioned(
                  left: 72,
                  top: 333,
                  width: 342,
                  child: Text(
                    'للتأكد من هوية حسابك',
                    textAlign: TextAlign.center,
                    style: _darkTitle,
                  ),
                ),
                const Positioned(
                  left: 36,
                  top: 374,
                  width: 414,
                  child: Text(
                    'برجاء إدخال الرمز من المكون من 5 أرقام الذي تم إرساله في رسالة نصية على رقم الهاتف للمتابعة',
                    textAlign: TextAlign.center,
                    style: _bodyText,
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 450,
                  width: 436,
                  height: 67,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/alkhat/screens/otp_section/assets/components/otp_typeinput.svg',
                        width: 436,
                        height: 67,
                        fit: BoxFit.contain,
                      ),
                      Positioned.fill(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            length: 5,
                            controller: _controller,
                            defaultPinTheme: pinTheme,
                            focusedPinTheme: pinTheme,
                            separatorBuilder: (_) => const SizedBox(width: 25),
                            validator: _uiOnly
                                ? null
                                : (value) => (value == null || value.length < 5) ? 'أدخل الرمز كاملاً' : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 29,
                  top: 548,
                  width: 428,
                  child: GestureDetector(
                    onTap: _resend,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Cairo', fontSize: 24, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(text: 'لم يصلك رمز التحقق؟ ', style: TextStyle(color: Color(0x80000000))),
                          TextSpan(text: 'إعادة الإرسال', style: TextStyle(color: Color(0xFFAA652B), fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 29,
                  top: 681,
                  width: 428,
                  child: Text(
                    'معلومة\nرمز التحقق OTP هو رمز مشفر يتكون من خمس أرقام يتم إرساله لأرقام الهاتف للتحقق من ملكيتها لصاحبها.\nإن لم يصلك رمز التحقق في خلال 5 دقائق، فقم بطلب الرمز من جديد عن طريق النقر على إعادة الإرسال أعلاه.',
                    textAlign: TextAlign.center,
                    style: _mutedBody,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 952,
                  width: 426,
                  height: 68,
                  child: GestureDetector(
                    onTap: _isLoading ? null : _submit,
                    child: Stack(
                      children: const [
                        Positioned.fill(
                          child: _ButtonSvg(
                            asset: 'assets/alkhat/screens/otp_section/assets/components/next.svg',
                          ),
                        ),
                        Center(
                          child: Text(
                            'المتابعة',
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
              ],
            ),
          ),
        ),
      ),
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
