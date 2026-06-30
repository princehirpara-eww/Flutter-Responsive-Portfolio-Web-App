import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AnimatedGlowingLogo extends StatefulWidget {
  final double size;
  const AnimatedGlowingLogo({super.key, this.size = 130});

  @override
  State<AnimatedGlowingLogo> createState() => _AnimatedGlowingLogoState();
}

class _AnimatedGlowingLogoState extends State<AnimatedGlowingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.08).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.08, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(_controller);

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
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
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer pulsing glow shadow ring
            Transform.scale(
              scale: _pulseAnimation.value,
              child: Container(
                width: widget.size + 12,
                height: widget.size + 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.androidGreen.withOpacity(0.4),
                      blurRadius: 24,
                      spreadRadius: 2,
                      offset: const Offset(-3, -3),
                    ),
                    BoxShadow(
                      color: AppColors.flutterBlue.withOpacity(0.4),
                      blurRadius: 24,
                      spreadRadius: 2,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
              ),
            ),
            // Rotating neon gradient ring
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: widget.size + 8,
                height: widget.size + 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      AppColors.androidGreen,
                      Colors.transparent,
                      AppColors.flutterBlue,
                      Colors.transparent,
                      AppColors.androidGreen,
                    ],
                  ),
                ),
              ),
            ),
            // Central glassmorphic circle container holding the avatar
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1E1E1E).withOpacity(0.9),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar_hp.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
