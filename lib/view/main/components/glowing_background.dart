import 'dart:ui';
import 'package:flutter/material.dart';

class GlowingBackground extends StatelessWidget {
  final Widget child;
  const GlowingBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        // 1. Dark base background
        Container(
          color: Colors.black,
        ),

        // 2. Glowing Ambient Radial Blobs
        Positioned(
          top: -120,
          right: -120,
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
          bottom: -150,
          left: -150,
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
          top: size.height * 0.35,
          left: size.width * 0.22,
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
        Positioned.fill(child: child),
      ],
    );
  }
}
