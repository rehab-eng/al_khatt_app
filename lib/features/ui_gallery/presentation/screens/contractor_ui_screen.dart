import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/design_canvas.dart';

class ContractorUiScreen extends StatelessWidget {
  const ContractorUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned(
                left: -179.0,
                top: -355.0,
                width: 845.0,
                height: 1455.0,
                child: Image.asset(
                  'assets/alkhat/screens/contractor_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 423.5,
                top: 20.0,
                width: 42.0,
                height: 41.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/icons/ic_round-arrow-back.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 143.0,
                top: 26.0,
                height: 29.0,
                child: const Text(
                  'معلومات المقاول',
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
                left: 63.5,
                top: 206.0,
                height: 29.0,
                child: const Text(
                  'أدخل معلومات المقاول للمتابعة',
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
                left: 192.0,
                top: 114.0,
                width: 102.0,
                height: 70.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/icons/map_general-contractor.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 112.0,
                top: 241.0,
                width: 262.0,
                child: const Text(
                  'CONTRACTOR',
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
                  'assets/alkhat/screens/contractor_ui/assets/icons/twemoji_flag-libya.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 510.0,
                width: 307.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/components/phone_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 157.0,
                top: 525.5,
                width: 164.0,
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
                left: 111.0,
                top: 342.0,
                width: 342.0,
                child: const Text(
                  'اسم المقاول أو الشركة (مطلوب)',
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
                top: 385.0,
                width: 426.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/components/contractorname_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 168.0,
                top: 401.0,
                width: 273.0,
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل اسم المقاول أو الشركة',
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
                left: 30.0,
                top: 592.0,
                width: 423.0,
                child: const Text(
                  'رقم الرخصة التجارية (إن وجد)',
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
                top: 635.0,
                width: 426.0,
                height: 60.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/components/serialnu_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 651.0,
                width: 411.0,
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
                left: 31.5,
                top: 717.0,
                width: 423.0,
                child: const Text(
                  'هل أنت سائق شاحنة أو عربة بجانب كونك مقاول؟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(170, 102, 44, 1.0),
                    letterSpacing: 0.0,
                    height: 1.4,
                  ),
                ),
              ),
              Positioned(
                left: 261.0,
                top: 807.0,
                width: 116.0,
                height: 42.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/components/yes_choice.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 109.0,
                top: 807.0,
                width: 116.0,
                height: 42.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/components/no_choice.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 126.5,
                top: 898.0,
                width: 233.0,
                height: 12.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/icons/2d.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30.0,
                top: 932.0,
                width: 426.0,
                height: 68.0,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/contractor_ui/assets/components/next.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 186.0,
                top: 947.0,
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
