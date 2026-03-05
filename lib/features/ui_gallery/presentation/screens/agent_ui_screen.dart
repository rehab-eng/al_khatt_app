import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/design_canvas.dart';

class AgentUiScreen extends StatelessWidget {
  const AgentUiScreen({super.key});

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
                  'assets/alkhat/screens/agent_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 423.5,
                top: 20.0,
                width: 42.0,
                height: 41.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/icons/ic_round-arrow-back.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 149.0,
                top: 26.0,
                height: 29.0,
                child: const Text(
                  'معلومات الوكيل',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                left: 69.5,
                top: 206.0,
                height: 29.0,
                child: const Text(
                  'أدخل معلومات الوكيل للمتابعة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                left: 197.0,
                top: 112.0,
                width: 92.0,
                height: 82.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/icons/mdi_face-agent.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 112.0,
                top: 241.0,
                width: 262.0,
                child: const Text(
                  'AGENT / SUPPLIER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                left: 197.0,
                top: 467.0,
                width: 256.0,
                child: const Text(
                  'رقم الهاتف (مطلوب)',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(170, 102, 44, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 349.0,
                top: 526.0,
                width: 51.96,
                child: const Text(
                  '+218',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(170, 102, 44, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 413.0,
                top: 525.0,
                width: 43.0,
                height: 31.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/icons/twemoji_flag-libya.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 510.0,
                width: 307.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/components/phone_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 47.0,
                top: 526.0,
                width: 274.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل رقم الهاتف',
                    textAlign: TextAlign.right,
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
                left: 75.0,
                top: 594.0,
                width: 378.0,
                child: const Text(
                  'رقم الرخصة التجارية (مطلوب)',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(170, 102, 44, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 30.0,
                top: 637.0,
                width: 426.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/components/serialnum_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 47.0,
                top: 653.0,
                width: 394.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل رقم الرخصة التجارية',
                    textAlign: TextAlign.right,
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
                left: 251.0,
                top: 721.0,
                width: 210.0,
                child: const Text(
                  'مقر الشركة (مطلوب)',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(170, 102, 44, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 251.0,
                top: 764.0,
                width: 213.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/components/corp_location_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 251.0,
                top: 780.0,
                width: 198.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل العنوان',
                    textAlign: TextAlign.right,
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
                left: 22.0,
                top: 721.0,
                width: 210.0,
                child: const Text(
                  'المجال التجاري (مطلوب)',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(170, 102, 44, 1.0),
                    letterSpacing: 0.0,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 22.0,
                top: 764.0,
                width: 213.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/components/areaofinter_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 22.0,
                top: 780.0,
                width: 198.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل المجال التجاري',
                    textAlign: TextAlign.right,
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
                left: 126.5,
                top: 918.0,
                width: 233.0,
                height: 12.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/icons/2nd_loading.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 952.0,
                width: 426.0,
                height: 68.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/agent_ui/assets/components/next.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 185.5,
                top: 967.0,
                height: 36.0,
                child: const Text(
                  'المتابعة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
