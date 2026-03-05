import 'package:flutter/material.dart';

class DesignCanvas extends StatelessWidget {
  const DesignCanvas({
    super.key,
    required this.child,
    this.designSize = const Size(486, 1080),
  });

  final Widget child;
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: designSize.width,
              height: designSize.height,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
