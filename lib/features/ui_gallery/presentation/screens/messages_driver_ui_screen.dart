import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/design_canvas.dart';

const _titleStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: Colors.black,
  height: 1.2,
);

const _searchPlaceholderStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Color(0x80000000),
  height: 1.2,
);

const _tabTextSelected = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 18,
  fontWeight: FontWeight.w800,
  color: Colors.white,
  height: 1.5,
);

const _tabText = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 18,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  height: 1.5,
);

const _nameStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: Colors.black,
  height: 1.5,
);

const _dateStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Color(0x80000000),
  height: 1.5,
);

const _messageStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Color(0xFFAA662C),
  height: 1.5,
);

class MessagesDriverUiScreen extends StatelessWidget {
  const MessagesDriverUiScreen({super.key});

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
                  'assets/alkhat/screens/messages_driver_ui/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 34,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/icons/menu_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 403,
                top: 30,
                width: 49,
                height: 49,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/icons/notification_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 200.5,
                top: 124,
                child: Text('الرسائل', style: _titleStyle),
              ),
              Positioned(
                left: 26,
                top: 174,
                width: 435,
                height: 60,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/search_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 157,
                top: 193,
                width: 287,
                child: Text(
                  'ابحث عن رسالة، زبون، إلخ...',
                  textAlign: TextAlign.right,
                  style: _searchPlaceholderStyle,
                ),
              ),
              Positioned(
                left: 24.5,
                top: 256,
                width: 105,
                height: 44,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/unselected.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 41.5,
                top: 265,
                child: Text('المفضلة', style: _tabText),
              ),
              Positioned(
                left: 140.5,
                top: 256,
                width: 105,
                height: 44,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/unselected.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 152.5,
                top: 265,
                child: Text('غير مقروء', style: _tabText),
              ),
              Positioned(
                left: 256.5,
                top: 256,
                width: 97,
                height: 44,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/unselected.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 278.5,
                top: 265,
                child: Text('مقروء', style: _tabText),
              ),
              Positioned(
                left: 364.5,
                top: 256,
                width: 97,
                height: 44,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/selected.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 393.5,
                top: 265,
                child: Text('الكل', style: _tabTextSelected),
              ),
              const _MessageCard(top: 336),
              const _MessageCard(top: 535),
              const _MessageCard(top: 734),
              Positioned(
                left: 41,
                top: 960,
                width: 404,
                height: 92,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/live_bar.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 87.5,
                top: 978,
                width: 41,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/myaccount_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 171.17,
                top: 978,
                width: 49,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/home_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 262.83,
                top: 978,
                width: 43,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/messages_button.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 348.5,
                top: 978,
                width: 49,
                height: 58.42,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/messages_driver_ui/assets/components/orders_icon.svg',
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

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.top});

  final double top;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 24,
          top: top,
          width: 444,
          height: 181,
          child: SvgPicture.asset(
            'assets/alkhat/screens/messages_driver_ui/assets/components/messagebox_overview.svg',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 283.25,
          top: top + 25,
          width: 107,
          child: const Text('محمد سعد', textAlign: TextAlign.right, style: _nameStyle),
        ),
        Positioned(
          left: 34.75,
          top: top + 25,
          width: 107,
          child: const Text('2025-10-15', textAlign: TextAlign.right, style: _dateStyle),
        ),
        Positioned(
          left: 396.25,
          top: top + 18,
          width: 55,
          height: 55,
          child: ClipOval(
            child: Image.asset(
              'assets/alkhat/screens/messages_driver_ui/assets/images/avatar.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 397.58,
          top: top + 59.86,
          width: 12.55,
          height: 12.55,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF008000),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          left: 33.88,
          top: top + 86,
          width: 418.25,
          height: 1,
          child: const Opacity(
            opacity: 0.5,
            child: ColoredBox(color: Colors.black),
          ),
        ),
        Positioned(
          left: 35,
          top: top + 97,
          width: 416,
          height: 84,
          child: const Text(
            '06:20 محمد: السلام عليكم ورحمة الله\n06:21 محمد: عندي بضاعة نبي نرفعها من تاجوراء',
            textAlign: TextAlign.right,
            style: _messageStyle,
          ),
        ),
      ],
    );
  }
}
