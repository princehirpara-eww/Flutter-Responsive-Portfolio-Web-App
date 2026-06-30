import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/home/home.dart';
import 'package:flutter_portfolio/view/main/components/glowing_background.dart';
import 'package:flutter_portfolio/view/splash/componenets/animated_glowing_logo.dart';
import 'package:flutter_portfolio/view/splash/componenets/animated_loading_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Timing transition to HomePage matching the loading bar progression
    Timer(const Duration(milliseconds: 3200), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GlowingBackground(
        child: Center(
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutBack,
            tween: Tween<double>(begin: 0.8, end: 1.0),
            builder: (context, scale, child) {
              return TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 800),
                tween: Tween<double>(begin: 0.0, end: 1.0),
                builder: (context, opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: Transform.scale(
                      scale: scale,
                      child: child,
                    ),
                  );
                },
                child: child,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  width: size.width > 440 ? 380 : size.width - 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding * 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AnimatedGlowingLogo(size: 110),
                      const SizedBox(height: defaultPadding * 1.5),
                      Text(
                        'PRINCE HIRPARA',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          letterSpacing: 4.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: defaultPadding * 0.4),
                      Text(
                        'Flutter & Android Developer',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.55),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.5,
                          letterSpacing: 0.8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: defaultPadding * 2.0),
                      const AnimatedLoadingText(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
