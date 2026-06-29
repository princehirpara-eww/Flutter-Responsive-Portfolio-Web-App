import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/text_styles.dart';
import 'package:flutter_portfolio/gen/fonts.gen.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../view model/responsive.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Safe space for floating navigation bar
            SizedBox(height: size.height * 0.12),

            // PRINCE (First Line)
            Text(
              'PRINCE',
              style: TextStyles.text54Bold.copyWith(
                color: AppColors.white,
                fontSize: Responsive.isDesktop(context)
                    ? 54
                    : Responsive.isTablet(context)
                        ? 45
                        : 36,
                height: 1.0,
              ),
            ),

            // HIRPARA (Second Line)
            Text(
              'HIRPARA',
              style: TextStyles.text74ExtraBold.copyWith(
                color: AppColors.white,
                fontSize: Responsive.isDesktop(context)
                    ? 74
                    : Responsive.isTablet(context)
                        ? 60
                        : 48,
                height: 1.0,
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle Role
            Text(
              'FLUTTER & ANDROID DEVELOPER',
              style: TextStyles.text15Regular.copyWith(
                color: Colors.white70,
                fontSize: Responsive.isDesktop(context)
                    ? 15
                    : Responsive.isTablet(context)
                        ? 13
                        : 11,
                letterSpacing: Responsive.isDesktop(context)
                    ? 6.0
                    : Responsive.isTablet(context)
                        ? 5.0
                        : 4.0,
              ),
            ),

            SizedBox(height: size.height * 0.06),

            // Two side-by-side capsule buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedHoverButton(
                  text: 'Resume',
                  onTap: () {
                    controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                const SizedBox(width: 20),
                OutlinedHoverButton(
                  text: 'Portfolio',
                  onTap: () {
                    controller.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),

            // Bottom padding to ensure nice layout spacing
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class OutlinedHoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const OutlinedHoverButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<OutlinedHoverButton> createState() => _OutlinedHoverButtonState();
}

class _OutlinedHoverButtonState extends State<OutlinedHoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context) ? 32 : 24,
            vertical: Responsive.isDesktop(context) ? 14 : 10,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.white, width: 1.5),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? const Color(0xFF191923) : AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: Responsive.isDesktop(context) ? 14 : 12,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
