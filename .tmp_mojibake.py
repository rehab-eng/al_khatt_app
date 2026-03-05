import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDriverUiScreen extends StatelessWidget {
  const HomeDriverUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SvgPicture.asset(
                'assets/alkhat/screens/home_driver_ui/assets/components/ads_placement.svg',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SvgPicture.asset(
                'assets/alkhat/screens/home_driver_ui/assets/components/search_bar.svg',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0),
              child: Text(
                'مساء الخير، جهاد',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF000000)),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('الرحلات', 'عرض المزيد'),
            const SizedBox(height: 15),
            _buildCategoryChips(),
            const SizedBox(height: 20),
            _buildSectionHeader('طلبات قريبة مني', 'عرض المزيد'),
            const SizedBox(height: 20),
            _buildTripCard(),
            const SizedBox(height: 20),
            _buildTripCard(), // Duplicating for demonstration
            const SizedBox(height: 90), // Space for the bottom nav bar
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          'assets/alkhat/screens/home_driver_ui/assets/images/Mask.png',
          width: double.infinity,
          height: 247.0,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 50, // Adjust as needed for status bar
          right: 16,
          child: SvgPicture.asset(
            'assets/alkhat/screens/home_driver_ui/assets/icons/notification_icon.svg',
            width: 49,
            height: 49,
          ),
        ),
        Positioned(
          top: 50, // Adjust as needed for status bar
          left: 16,
          child: SvgPicture.asset(
            'assets/alkhat/screens/home_driver_ui/assets/icons/menu_bar.svg',
            width: 49,
            height: 49,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 21.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFF000000)),
          ),
          Text(
            actionText,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 21.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFFAA652B)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildChip('اسمنت'),
          _buildChip('رملة'),
          _buildChip('ميستو'),
          _buildChip('حديد'),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF482100), Color(0xFFAA652B)]),
          borderRadius: BorderRadius.circular(50.0)),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF)),
      ),
    );
  }

  Widget _buildTripCard() {
    // This is a placeholder for the trip card.
    // I will replace the inline SVGs with proper widgets in the next step.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '''نقل حديد 1 طن
الموقع: تاجوراء، ليبيا''',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFAA652B)),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text('الوزن: 1 طن',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600)),
                  SizedBox(width: 20),
                  Text('طرق الدفع: كاش',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const Divider(height: 20),
              Row(
                children: [
                  // Placeholder for user avatar
                  const CircleAvatar(
                    radius: 23,
                    //backgroundImage: AssetImage('...'),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('محمد سعد',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900)),
                      Text('2025-10-15',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                  const Spacer(),
                  // Placeholder for star icon
                  const Icon(Icons.star, color: Colors.amber, size: 40),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/alkhat/screens/home_driver_ui/assets/components/message_button.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/alkhat/screens/home_driver_ui/assets/components/call_button.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              'assets/alkhat/screens/home_driver_ui/assets/icons/home_icon.svg'),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              'assets/alkhat/screens/home_driver_ui/assets/icons/orders_icon.svg'),
          label: 'الطلبات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              'assets/alkhat/screens/home_driver_ui/assets/icons/messsages_icon.svg'),
          label: 'الرسائل',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              'assets/alkhat/screens/home_driver_ui/assets/icons/myaccount_icon.svg'),
          label: 'حسابي',
        ),
      ],
      selectedItemColor: const Color(0xFFAA652B),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
import re
import pathlib
text = pathlib.Path('lib/features/ui_gallery/presentation/screens/agent_ui_screen.dart').read_text(encoding='utf-8')
vals = sorted({m for m in re.findall(r"'([^']*)'", text) if 'Ø' in m or 'Ù' in m})
print('\n'.join(vals))
