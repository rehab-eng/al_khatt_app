import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/design_canvas.dart';

class PasswordDriverSectionScreen extends StatelessWidget {
  const PasswordDriverSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned(
                left: -179.5,
                top: -335.0,
                width: 845.0,
                height: 1435.0,
                child: Image.asset(
                  'assets/alkhat/screens/password_driver_section/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 423.5,
                top: 20.0,
                width: 42.0,
                height: 41.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/icons/ic_round-arrow-back.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 177.5,
                top: 26.17,
                height: 29.0,
                child: Text(
                  'كلمة المرور',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFFFFF),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 187.0,
                top: 131.0,
                width: 112.0,
                height: 59.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/icons/material-symbols_password-rounded.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 184.5,
                top: 206.97,
                height: 29.0,
                child: Text(
                  'آخر خطوات',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFFFFF),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 42.0,
                top: 242.0,
                width: 402.0,
                child: Text(
                  'إنشاء الحساب',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 72.0,
                top: 333.0,
                width: 342.0,
                child: Text(
                  'إنشاء كلمة مرور',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 36.0,
                top: 374.0,
                width: 414.0,
                child: Text(
                  'للحفاظ على خصوصية وأمن معلوماتك، أدخل كلمة سر',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                    height: 1.3,
                  ),
                ),
              ),
              Positioned(
                left: 253.0,
                top: 423.0,
                width: 200.0,
                child: Text(
                  'كلمة المرور',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFAA662C),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 30.0,
                top: 466.0,
                width: 426.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/components/enterpass_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 40.0,
                top: 481.0,
                width: 34.0,
                height: 29.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/icons/clarity_eye-hide-solid.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 277.0,
                top: 482.0,
                width: 164.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل كلمة المرور',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4E4E4E),
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 160.0,
                top: 549.0,
                width: 293.0,
                child: Text(
                  'أعد كتابة كلمة المرور',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFAA662C),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 30.0,
                top: 592.0,
                width: 426.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/components/enterpass_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 40.0,
                top: 607.0,
                width: 34.0,
                height: 29.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/icons/clarity_eye-hide-solid.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 277.0,
                top: 608.0,
                width: 164.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل كلمة المرور',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4E4E4E),
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29.0,
                top: 681.0,
                width: 428.0,
                child: Text(
                  '''??????
???? ????? ????? ???? ???? ?????? ?? ?? ??? ???? ?????? ?? ?????? ?????? ????? ??????? ?????? (.?*?-?\?-?%? ???...) ??? ???? ?????? ?????? ??????? ???? ???????? ???????.''',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0x80000000),
                    height: 1.25,
                  ),
                ),
              ),
              Positioned(
                left: 126.5,
                top: 918.0,
                width: 233.0,
                height: 12.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/icons/6th.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 952.0,
                width: 426.0,
                height: 68.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/password_driver_section/assets/components/next.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
