import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/design_canvas.dart';

class AccountcreatedSectionScreen extends StatelessWidget {
  const AccountcreatedSectionScreen({super.key});

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
                top: -335,
                width: 845,
                height: 1435,
                child: Image.asset(
                  'assets/alkhat/screens/accountcreated_section/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 165.5,
                top: 213,
                width: 155,
                height: 131,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/accountcreated_section/assets/icons/mdi_account-check.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 72,
                top: 370,
                width: 342,
                child: Text(
                  'تم إنشاء الحساب بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(170, 101, 43, 1),
                    height: 1.2,
                  ),
                ),
              ),
              const Positioned(
                left: 72,
                top: 428.67,
                width: 342,
                child: Text(
                  'أهلا وسهلاً، السيد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.2,
                  ),
                ),
              ),
              const Positioned(
                left: 72,
                top: 480.33,
                width: 342,
                child: Text(
                  'اسم المستخدم',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(170, 101, 43, 1),
                    height: 1.2,
                  ),
                ),
              ),
              const Positioned(
                left: 36,
                top: 545,
                width: 414,
                child: Text(
                  'تم إنشاء حسابك بنجاح، أهلا بك في عائلة الخط اضغط على زر المتابعة لفتح الصفحة الرئيسية والتمتع بخدمات تطبيق الخط المتنوعة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              const Positioned(
                left: 29,
                top: 682,
                width: 428,
                child: Text(
                  'معلومة للاطلاع على قواعد وسياسات استخدام هذا التطبيق، يمكنك الاطلاع عليها إما على الموقع الرسمي لشركة خطوط الرمال، أو بالضغط على قواعد الاستخدام وقواعد الخصوصية المدرجة أدناه، وننصح الزبائن بالاطلاع على حالات إخلاء المسؤولية المعلنة من طرف شركة خطوط الرمال، والمحـمية بالقانون.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    height: 1.3,
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 887,
                width: 426,
                child: Text(
                  'عن طريق المتابعة أنت توافق على قواعد الاستخدام وقواعد الخصوصية',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 952,
                width: 426,
                height: 68,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/accountcreated_section/assets/components/next.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 185.5,
                top: 967,
                height: 36,
                child: Text(
                  'المتابعة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(255, 255, 255, 1),
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
