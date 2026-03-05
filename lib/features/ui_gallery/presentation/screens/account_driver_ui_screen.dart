import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/design_canvas.dart';

class AccountDriverUiScreen extends StatelessWidget {
  const AccountDriverUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned(
                left: -182,
                top: -340,
                width: 847.5,
                height: 1435,
                child: Image.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 34,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/menu_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 403,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/notification_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 152,
                top: 44,
                width: 182,
                height: 182,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/profile_placement.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 75,
                top: 232,
                width: 336,
                child: Text(
                  'نوع الحساب: سائق',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 25.5,
                top: 262.5,
                width: 435,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/username_place.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 255.5,
                top: 274.5,
                width: 189,
                child: Text(
                  'محمد التارقي',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 31.5,
                top: 274.5,
                width: 238,
                child: Text(
                  'عضو منذ 2025/10/15',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 342.4,
                width: 435,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      width: 207,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/alkhat/screens/account_driver_ui/assets/components/platenumb_placement.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      left: 229,
                      top: 0,
                      width: 207,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/alkhat/screens/account_driver_ui/assets/components/accountnumber_placement.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 351,
                top: 353.4,
                width: 92,
                height: 28,
                child: Text(
                  'رقم حساب:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 122,
                top: 353.4,
                width: 92,
                height: 28,
                child: Text(
                  'رقم رخصة:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 267,
                top: 353.4,
                width: 72,
                height: 28,
                child: Text(
                  '1151235',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 37,
                top: 353.4,
                width: 72,
                height: 28,
                child: Text(
                  '1154',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 412.3,
                width: 435,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      width: 207,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/alkhat/screens/account_driver_ui/assets/components/roads_placement.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      left: 229,
                      top: 0,
                      width: 207,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/alkhat/screens/account_driver_ui/assets/components/vechpla_placement.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 337,
                top: 423.3,
                width: 107,
                height: 28,
                child: Text(
                  'رقم اللوحة:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 122,
                top: 423.3,
                width: 92,
                height: 28,
                child: Text(
                  'الرحلات:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 37,
                top: 423.3,
                width: 72,
                height: 28,
                child: Text(
                  '500',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 267,
                top: 423.3,
                width: 72,
                height: 28,
                child: Text(
                  '550500',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 25.5,
                top: 482.2,
                width: 435,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/phonenumber_placement.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 243,
                top: 493.2,
                width: 197,
                child: Text(
                  'رقم الهاتف:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 45,
                top: 493.2,
                width: 197,
                child: Text(
                  '091000000',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 25.5,
                top: 562.1,
                width: 435,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/vechname_placement.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 243,
                top: 573.1,
                width: 197,
                child: Text(
                  'اسم المركبة:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 45,
                top: 573.1,
                width: 197,
                child: Text(
                  'بوتر 2012',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 60,
                top: 642,
                width: 172.71,
                height: 44,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/shareaccount_button.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 253.29,
                top: 642,
                width: 172.71,
                height: 44,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/editaccount_button.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 33.88,
                top: 709.64,
                width: 418.25,
                height: 0.01,
                child: Opacity(
                  opacity: 0.5,
                  child: SvgPicture.string(
                    r'''<svg width="428.249" xmlns="http://www.w3.org/2000/svg" height="10.01" viewBox="2548.876 6336.641 428.249 10.01" fill="none" version="1.1">
      <g style="opacity:0.5">
        <g>
          <path d="M2553.87548828125,6341.64111328125L2972.12451171875,6341.64111328125"></path>
        </g>
        <g class="strokes">
          <g class="stroke-shape">
            <path d="M2553.87548828125,6341.64111328125L2972.12451171875,6341.64111328125" style="fill:none;stroke-width:2;stroke:#000000;stroke-opacity:1;stroke-linecap:round"></path>
          </g>
        </g>
      </g>
    </svg>''',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                left: 264,
                top: 723,
                width: 197,
                child: Text(
                  'المحفظة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 730,
                width: 197,
                child: Text(
                  'شروط وأحكام رأس المال',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(170, 102, 44, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 766,
                width: 435,
                height: 139,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/vaultmoney_placement.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 243,
                top: 777,
                width: 197,
                child: Text(
                  'رأس المال:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 44,
                top: 777,
                width: 262,
                child: Text(
                  'عمليات سحب رأس المال >',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(170, 102, 44, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 365,
                top: 825,
                width: 75,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/material-symbols_wallet.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 45,
                top: 823,
                width: 274,
                child: Text(
                  'خصومات الوكيل: 7%',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 45,
                top: 837,
                width: 274,
                child: Text(
                  '1,500 د.ل.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 264,
                top: 913.75,
                width: 197,
                child: Text(
                  'العربيات والدفع الثابت',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(170, 102, 44, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 913.75,
                width: 197,
                child: Text(
                  'المحفظة مشفرة',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 146,
                top: 914.25,
                width: 18,
                height: 22,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/icons/material-symbols_encrypted-rounded.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 41,
                top: 960,
                width: 404,
                height: 92,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/live_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 87.5,
                top: 978,
                width: 41,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/myaccount_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 171.17,
                top: 978,
                width: 49,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/home_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 262.83,
                top: 978,
                width: 43,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/messsages_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 348.5,
                top: 978,
                width: 49,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/account_driver_ui/assets/components/orders_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 87.5,
                top: 1016.42,
                width: 41,
                child: Text(
                  'حسابي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 171.17,
                top: 1016.42,
                width: 49,
                child: Text(
                  'الرئيسية',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 262.83,
                top: 1016.42,
                width: 43,
                child: Text(
                  'الرسائل',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 348.5,
                top: 1016.42,
                width: 49,
                child: Text(
                  'الطلبات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    height: 1.5,
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
