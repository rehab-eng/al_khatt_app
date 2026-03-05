import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/design_canvas.dart';

class OtpDriverSectionScreen extends StatelessWidget {
  const OtpDriverSectionScreen({super.key});

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
                  'assets/alkhat/screens/otp_driver_section/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 423.5,
                top: 20.0,
                width: 42.0,
                height: 41.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/icons/ic_round-arrow-back.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 141.0,
                top: 26.17,
                height: 29.0,
                child: Text(
                  'التحقق من الهوية',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 196.5,
                top: 119.0,
                width: 93.0,
                height: 75.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/icons/svg-path.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 55.5,
                top: 206.97,
                height: 29.0,
                child: Text(
                  'أرسلنا رمز التحقق على رقم الهاتف',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 42.0,
                top: 242.0,
                width: 402.0,
                child: Text(
                  'أدخل الرمز الذي وصلكم على رقم هاتفكم',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 72.0,
                top: 333.0,
                width: 342.0,
                child: Text(
                  'للتأكد من هوية حسابك',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 36.0,
                top: 374.0,
                width: 414.0,
                child: Text(
                  'برجاء إدخال الرمز من المكون من 5 أرقام الذي تم إرساله في رسالة نصية على رقم الهاتف للمتابعة',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    letterSpacing: 0.0,
                    height: 1.3,
                  ),
                ),
              ),
              Positioned(
                left: 393.92,
                top: 450.0,
                width: 67.08,
                height: 67.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/components/1st_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 302.25,
                top: 450.0,
                width: 67.08,
                height: 67.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/components/2nd_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 209.46,
                top: 450.0,
                width: 67.08,
                height: 67.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/components/3rd_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 117.79,
                top: 450.0,
                width: 67.08,
                height: 67.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/components/4th_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 25.0,
                top: 450.0,
                width: 67.08,
                height: 67.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/components/5th_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 411.81,
                top: 474.57,
                width: 30.18,
                height: 26.8,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(78, 78, 78, 1.0),
                      letterSpacing: 0.0,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 320.14,
                top: 474.57,
                width: 30.18,
                height: 26.8,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(78, 78, 78, 1.0),
                      letterSpacing: 0.0,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 227.35,
                top: 474.57,
                width: 30.18,
                height: 26.8,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(78, 78, 78, 1.0),
                      letterSpacing: 0.0,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 135.68,
                top: 474.57,
                width: 30.18,
                height: 26.8,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(78, 78, 78, 1.0),
                      letterSpacing: 0.0,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 42.89,
                top: 474.57,
                width: 30.18,
                height: 26.8,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(78, 78, 78, 1.0),
                      letterSpacing: 0.0,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29.0,
                top: 548.0,
                width: 428.0,
                child: Text(
                  'لم يصلك رمز التحقق؟ إعادة الإرسال',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 29.0,
                top: 681.0,
                width: 428.0,
                child: Text(
                  'معلومة\nرمز التحقق OTP هو رمز مشفر يتكون من خمس أرقام يتم إرساله لأرقام الهاتف للتحقق من ملكيتها لصاحبها.\nإن لم يصلك رمز التحقق في خلال 5 دقائق، فقم بطلب الرمز من جديد عن طريق النقر على إعادة الإرسال أعلاه.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    letterSpacing: 0.0,
                    height: 1.25,
                  ),
                ),
              ),
              Positioned(
                left: 66.0,
                top: 898.0,
                width: 354.0,
                height: 12.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/icons/5th.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 952.0,
                width: 426.0,
                height: 68.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/otp_driver_section/assets/components/next.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 185.5,
                top: 967.0,
                height: 36.0,
                child: Text(
                  'المتابعة',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
