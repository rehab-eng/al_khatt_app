import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFF3EAD0),
    this.highlightColor = const Color(0xFFFFF8E4),
    this.duration = const Duration(milliseconds: 1200),
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
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
      child: widget.child,
      builder: (context, child) {
        final value = _controller.value;
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment(-1 - value, -0.3),
              end: Alignment(1 + value, 0.3),
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.1, 0.5, 0.9],
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
    );
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.radius = 8,
  });

  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: AppColors.border),
        ),
      ),
    );
  }
}
