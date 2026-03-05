import 'package:flutter/material.dart';

import '../screens/accountcreated_section_screen.dart';

class AccountCreatedAnimatedPage extends StatefulWidget {
  const AccountCreatedAnimatedPage({super.key});

  @override
  State<AccountCreatedAnimatedPage> createState() =>
      _AccountCreatedAnimatedPageState();
}

class _AccountCreatedAnimatedPageState extends State<AccountCreatedAnimatedPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _opacity = Tween<double>(begin: 0, end: 1).animate(curved);
    _scale = Tween<double>(begin: 0.96, end: 1).animate(curved);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: const AccountcreatedSectionScreen(),
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.scale(
            scale: _scale.value,
            child: child,
          ),
        );
      },
    );
  }
}
