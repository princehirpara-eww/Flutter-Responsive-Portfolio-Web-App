import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.easeInOutCubic,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, value, child) => Column(
          children: [
            // Ambient Neon Progress Tracker Bar
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white.withOpacity(0.08),
                  width: 1.0,
                ),
              ),
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: constraints.maxWidth * value,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.androidGreen,
                              AppColors.flutterBlue,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.androidGreen.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(-2, 0),
                            ),
                            BoxShadow(
                              color: AppColors.flutterBlue.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(2, 0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding * 0.8),
            // Premium Typography loading label
            Text(
              'LOADING  ${(value * 100).toInt()}%',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
                fontSize: 11,
                letterSpacing: 2.5,
                shadows: [
                  Shadow(
                    color: AppColors.androidGreen.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(-1, -1),
                  ),
                  Shadow(
                    color: AppColors.flutterBlue.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
