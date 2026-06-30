import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class GlowingBackground extends StatefulWidget {
  final Widget child;
  const GlowingBackground({super.key, required this.child});

  @override
  State<GlowingBackground> createState() => _GlowingBackgroundState();
}

class _GlowingBackgroundState extends State<GlowingBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // A slow repeating animation (20 seconds loop)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate slow drifting offsets using sine and cosine waves
        final double t = _controller.value * 2 * math.pi;
        
        // Drift offsets
        final double trOffsetDy = math.sin(t) * 25;
        final double trOffsetDx = math.cos(t) * 20;

        final double blOffsetDy = math.cos(t + math.pi / 2) * 20;
        final double blOffsetDx = math.sin(t + math.pi / 2) * 30;

        final double midOffsetDy = math.sin(t * 2) * 15;
        final double midOffsetDx = math.cos(t * 2) * 15;

        return Stack(
          children: [
            // 1. Dark base background
            Container(
              color: Colors.black,
            ),

            // 2. Glowing Ambient Radial Blobs
            Positioned(
              top: -120 + trOffsetDy,
              right: -120 + trOffsetDx,
              child: Container(
                width: size.width * 0.4 > 350 ? size.width * 0.4 : 350,
                height: size.width * 0.4 > 350 ? size.width * 0.4 : 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF2B53C8).withOpacity(0.22),
                ),
              ),
            ),
            Positioned(
              bottom: -150 + blOffsetDy,
              left: -150 + blOffsetDx,
              child: Container(
                width: size.width * 0.45 > 400 ? size.width * 0.45 : 400,
                height: size.width * 0.45 > 400 ? size.width * 0.45 : 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF6E8DE8).withOpacity(0.12),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.35 + midOffsetDy,
              left: size.width * 0.22 + midOffsetDx,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF305CDE).withOpacity(0.08),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 130.0, sigmaY: 130.0),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            // 3. Page Content
            Positioned.fill(child: widget.child),
          ],
        );
      },
    );
  }
}
