import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/design_canvas.dart';

const _headerStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: Colors.white,
  height: 1.2,
);

const _driverEnglishStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  height: 1.2,
);

const _labelBrownStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Color(0xFFAA662C),
  height: 1.2,
);

const _labelRequiredStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.black,
  height: 1.2,
);

const _placeholderStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Color(0xFF4E4E4E),
  height: 1.2,
);

const _uploadTextStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  height: 1.2,
);

const _buttonTextStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 30,
  fontWeight: FontWeight.w800,
  color: Colors.white,
  height: 1.2,
);

class DriverUiScreen extends StatelessWidget {
  const DriverUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned(
                left: -179,
                top: -355,
                width: 845,
                height: 1455,
                child: Image.asset(
                  'assets/alkhat/screens/driver_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 423.5,
                top: 20,
                width: 42,
                height: 41,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/icons/ic_round-arrow-back.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 148,
                top: 26,
                child: Text(
                  'معلومات السائق',
                  textAlign: TextAlign.center,
                  style: _headerStyle,
                ),
              ),
              const Positioned(
                left: 68.5,
                top: 206,
                child: Text(
                  'أدخل معلومات السائق للمتابعة',
                  textAlign: TextAlign.center,
                  style: _headerStyle,
                ),
              ),
              Positioned(
                left: 198.5,
                top: 87,
                width: 89,
                height: 101,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/icons/healthicons_truck-driver.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 112,
                top: 241,
                width: 262,
                child: Text(
                  'DRIVER',
                  textAlign: TextAlign.center,
                  style: _driverEnglishStyle,
                ),
              ),
              Positioned(
                left: 111,
                top: 340,
                width: 342,
                child: const _RequiredLabel(text: 'اسم السائق '),
              ),
              Positioned(
                left: 30,
                top: 383,
                width: 426,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/components/drivername_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 168,
                top: 399,
                width: 273,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل اسم السائق',
                    textAlign: TextAlign.right,
                    style: _placeholderStyle,
                  ),
                ),
              ),
              Positioned(
                left: 197,
                top: 462.1,
                width: 256,
                child: const _RequiredLabel(text: 'رقم الهاتف '),
              ),
              Positioned(
                left: 30,
                top: 505.1,
                width: 307,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/components/number_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 157,
                top: 520.6,
                width: 164,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل رقم الهاتف',
                    textAlign: TextAlign.right,
                    style: _placeholderStyle,
                  ),
                ),
              ),
              const Positioned(
                left: 349,
                top: 521.1,
                width: 51.96,
                child: Text(
                  '+218',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFAA662C),
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 413,
                top: 520.1,
                width: 43,
                height: 31,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/icons/twemoji_flag-libya.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30,
                top: 584.2,
                width: 423,
                child: const _RequiredLabel(text: 'رقم رخصة القيادة '),
              ),
              Positioned(
                left: 30,
                top: 627.2,
                width: 426,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/components/driverlice_typeinput.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 30,
                top: 643.2,
                width: 411,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أدخل رقم رخصة القيادة',
                    textAlign: TextAlign.right,
                    style: _placeholderStyle,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 707.8,
                width: 426,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/components/uoloadfromstudio_button.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 111.5,
                top: 725.8,
                width: 263,
                child: Text(
                  'أرفع صورة من رخصة القيادة',
                  textAlign: TextAlign.center,
                  style: _uploadTextStyle,
                ),
              ),
              const Positioned(
                left: 37.5,
                top: 777.4,
                width: 411,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'أو',
                    textAlign: TextAlign.center,
                    style: _placeholderStyle,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 811,
                width: 426,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/components/uoloadfromcamera_button.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 111.5,
                top: 829,
                width: 263,
                child: Text(
                  'إلتقاط صورة عن طريق الكاميرا',
                  textAlign: TextAlign.center,
                  style: _uploadTextStyle,
                ),
              ),
              Positioned(
                left: 66,
                top: 898,
                width: 354,
                height: 12,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/driver_ui/assets/icons/2d.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30,
                top: 932,
                width: 426,
                height: 68,
                child: Stack(
                  children: const [
                    Positioned.fill(
                      child: _ButtonSvg(
                        asset: 'assets/alkhat/screens/driver_ui/assets/components/next.svg',
                      ),
                    ),
                    Positioned(
                      left: 156,
                      top: 15,
                      child: Text(
                        'المتابعة',
                        textAlign: TextAlign.center,
                        style: _buttonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
    return SvgPicture.asset(asset, fit: BoxFit.contain);
  }
}

class _RequiredLabel extends StatelessWidget {
  const _RequiredLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        children: [
          TextSpan(text: text, style: _labelBrownStyle),
          const TextSpan(text: '(مطلوب)', style: _labelRequiredStyle),
        ],
      ),
    );
  }
}
