import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../domain/entities/app_user.dart';
import '../controllers/auth_controller.dart';

const _titleStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: Colors.white,
  height: 1.2,
);

const _sectionTitleStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: Colors.black,
  height: 1.2,
);

const _subtitleStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: Color(0xFFAA652B),
  height: 1.2,
);

const _cardTitleStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: Colors.black,
  height: 1.2,
);

const _cardEnglishStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 18,
  fontWeight: FontWeight.w900,
  color: Color(0xFFAA652B),
  height: 1.2,
);

const _descBrownStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 16,
  fontWeight: FontWeight.w800,
  color: Color(0xFFAA652B),
  height: 1.5,
);

const _descBlackStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  height: 1.5,
);

const _buttonTextStyle = TextStyle(
  fontFamily: 'Cairo',
  fontSize: 30,
  fontWeight: FontWeight.w800,
  color: Colors.white,
  height: 1.2,
);

class RoleSelectionPage extends ConsumerStatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  ConsumerState<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends ConsumerState<RoleSelectionPage> {
  static const bool _uiOnly = true;
  UserRole? _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = ref.read(authControllerProvider).selectedRole;
    if (_uiOnly && _selectedRole == null) {
      _selectedRole = UserRole.contractor;
      ref.read(authControllerProvider.notifier).selectRole(_selectedRole!);
    }
  }

  void _selectRole(UserRole role) {
    setState(() => _selectedRole = role);
    ref.read(authControllerProvider.notifier).selectRole(role);
  }

  void _continue() {
    final role = _selectedRole ?? (_uiOnly ? UserRole.contractor : null);
    if (role == null) return;
    if (_selectedRole == null) {
      setState(() => _selectedRole = role);
      ref.read(authControllerProvider.notifier).selectRole(role);
    }
    if (role == UserRole.contractor) {
      context.go(AppRoutes.contractorInfo);
    } else if (role == UserRole.driver) {
      context.go(AppRoutes.driverInfo);
    } else {
      context.go(AppRoutes.agentInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DesignCanvas(
          child: Stack(
            children: [
              Positioned(
                left: -180,
                top: -335,
                width: 845,
                height: 1435,
                child: Image.asset(
                  'assets/alkhat/screens/create_new_acc/assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 423,
                top: 19,
                width: 42,
                height: 41,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(
                    'assets/alkhat/screens/create_new_acc/assets/icons/ic_round-arrow-back.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                left: 176,
                top: 25,
                child: Text('إنشاء حساب', style: _titleStyle),
              ),
              Positioned(
                left: 196,
                top: 98,
                width: 89,
                height: 89,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/create_new_acc/assets/icons/mdi_account.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                left: 153,
                top: 194,
                child: Text('اختر نوع الحساب', style: _sectionTitleStyle),
              ),
              const Positioned(
                left: 106,
                top: 232,
                child: Text('حدد مجال عملك للمتابعة ...', style: _subtitleStyle),
              ),
              Positioned(
                left: 34.5,
                top: 290,
                width: 417,
                height: 178,
                child: _RoleCard(
                  selected: _selectedRole == UserRole.contractor,
                  onTap: () => _selectRole(UserRole.contractor),
                  iconAsset:
                      'assets/alkhat/screens/create_new_acc/assets/icons/map_general-contractor.svg',
                  iconLeft: 287.5,
                  iconTop: 19,
                  iconWidth: 57,
                  iconHeight: 39,
                  title: 'التسجيل كمقاول',
                  english: 'CONTRACTOR',
                  englishLeft: 160.25,
                  indicatorTop: 21,
                  description: const _RoleDescription(
                    lines: [
                      _DescLine(
                        text: 'اختر نوع حساب مقاول لو أنك:',
                        isHighlight: true,
                      ),
                      _DescLine(
                        text: 'صاحب مشروع | شركة بناء تبحث عن عمالة أو معدات',
                      ),
                      _DescLine(
                        text: 'شركة تبحث عن مواد لإنجاز مهام مطلوبة',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34.5,
                top: 498.5,
                width: 417,
                height: 178,
                child: _RoleCard(
                  selected: _selectedRole == UserRole.driver,
                  onTap: () => _selectRole(UserRole.driver),
                  iconAsset:
                      'assets/alkhat/screens/create_new_acc/assets/icons/healthicons_truck-driver.svg',
                  iconLeft: 295.5,
                  iconTop: 13,
                  iconWidth: 46,
                  iconHeight: 52,
                  title: 'التسجيل كسائق',
                  english: 'DRIVER',
                  englishLeft: 160.25,
                  indicatorTop: 21.5,
                  description: const _RoleDescription(
                    lines: [
                      _DescLine(
                        text: 'اختر نوع حساب سائق لو أنك:',
                        isHighlight: true,
                      ),
                      _DescLine(
                        text:
                            'عندك شاحنة أو عربة نقل | متخصص في نقل المواد والمعدات بين الموردين والمخازن والمشاريع والمدن',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34.5,
                top: 707,
                width: 417,
                height: 178,
                child: _RoleCard(
                  selected: _selectedRole == UserRole.agent,
                  onTap: () => _selectRole(UserRole.agent),
                  iconAsset:
                      'assets/alkhat/screens/create_new_acc/assets/icons/mdi_face-agent.svg',
                  iconLeft: 291.5,
                  iconTop: 15,
                  iconWidth: 54,
                  iconHeight: 48,
                  title: 'التسجيل كوكيل',
                  english: 'AGENT / SUPPLIER',
                  englishLeft: 96.5,
                  indicatorTop: 21,
                  description: const _RoleDescription(
                    lines: [
                      _DescLine(
                        text: 'اختر نوع حساب وكيل لو أنك:',
                        isHighlight: true,
                      ),
                      _DescLine(
                        text:
                            'شركة مواد ومستلزمات بناء | شركة تقدم في عروض للمقاولين والسائقين | وكيل لشركة مقاولات وبناء',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 126.5,
                top: 917,
                width: 233,
                height: 12,
                child: SvgPicture.asset(
                  'assets/alkhat/screens/create_new_acc/assets/icons/Group.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 30,
                top: 951,
                width: 426,
                height: 68,
                child: GestureDetector(
                  onTap:
                      _uiOnly ? _continue : (_selectedRole == null ? null : _continue),
                  child: Stack(
                    children: const [
                      Positioned.fill(
                        child: _ButtonSvg(
                          asset:
                              'assets/alkhat/screens/create_new_acc/assets/components/next_button.svg',
                        ),
                      ),
                      Positioned(
                        left: 155.5,
                        top: 15,
                        child: Text('المتابعة', style: _buttonTextStyle),
                      ),
                    ],
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

class _ButtonSvg extends StatelessWidget {
  const _ButtonSvg({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(asset, fit: BoxFit.contain);
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.selected,
    required this.onTap,
    required this.iconAsset,
    required this.iconLeft,
    required this.iconTop,
    required this.iconWidth,
    required this.iconHeight,
    required this.title,
    required this.english,
    required this.englishLeft,
    required this.indicatorTop,
    required this.description,
  });

  final bool selected;
  final VoidCallback onTap;
  final String iconAsset;
  final double iconLeft;
  final double iconTop;
  final double iconWidth;
  final double iconHeight;
  final String title;
  final String english;
  final double englishLeft;
  final double indicatorTop;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    final indicatorAsset = selected
        ? 'assets/alkhat/screens/create_new_acc/assets/icons/svg-g (1).svg'
        : 'assets/alkhat/screens/create_new_acc/assets/icons/svg-g.svg';

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SvgPicture.asset(
            selected
                ? 'assets/alkhat/screens/create_new_acc/assets/components/selected_box.svg'
                : 'assets/alkhat/screens/create_new_acc/assets/components/unselected_box.svg',
            width: 417,
            height: 178,
            fit: BoxFit.contain,
          ),
          Positioned(
            left: 377.75,
            top: indicatorTop,
            width: 35,
            height: 35,
            child: SvgPicture.asset(indicatorAsset, fit: BoxFit.contain),
          ),
          Positioned(
            left: iconLeft,
            top: iconTop,
            width: iconWidth,
            height: iconHeight,
            child: SvgPicture.asset(iconAsset, fit: BoxFit.contain),
          ),
          Positioned(
            left: 77.25,
            top: 12,
            child: Text(title, style: _cardTitleStyle),
          ),
          Positioned(
            left: englishLeft,
            top: 44,
            child: Text(english, style: _cardEnglishStyle),
          ),
          Positioned(
            left: 21.5,
            top: 101,
            width: 383,
            child: description,
          ),
        ],
      ),
    );
  }
}

class _RoleDescription extends StatelessWidget {
  const _RoleDescription({required this.lines});

  final List<_DescLine> lines;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          for (int i = 0; i < lines.length; i++)
            TextSpan(
              text: '${lines[i].text}${i == lines.length - 1 ? '' : '\n'}',
              style: lines[i].isHighlight ? _descBrownStyle : _descBlackStyle,
            ),
        ],
      ),
    );
  }
}

class _DescLine {
  const _DescLine({required this.text, this.isHighlight = false});

  final String text;
  final bool isHighlight;
}
