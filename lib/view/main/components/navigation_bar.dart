import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  final int activeIndex;
  const TopNavigationBar({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    final showFullMenu = MediaQuery.sizeOf(context).width > 850;

    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: showFullMenu ? 40.0 : 16.0,
          vertical: 12.0,
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Logo Badge
            _buildLogo(),

            // 2. Navigation Capsule Menu (only on Desktop & Tablet)
            if (showFullMenu)
              _buildNavCapsule(context)
            else
              const SizedBox.shrink(),

            // 3. Let's Talk CTA Button (Desktop/Tablet) or Empty Space (Mobile)
            if (showFullMenu)
              _buildLetsTalkButton()
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1E1E1E).withOpacity(0.8),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'PH',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildNavCapsule(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavigationButtonList(activeIndex: activeIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLetsTalkButton() {
    return const _LetsTalkButton();
  }
}

class _LetsTalkButton extends StatefulWidget {
  const _LetsTalkButton();

  @override
  State<_LetsTalkButton> createState() => _LetsTalkButtonState();
}

class _LetsTalkButtonState extends State<_LetsTalkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse('mailto:prince.eww@gmail.com')),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withOpacity(0.12)
                : const Color(0xFF1E1E1E).withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _isHovered ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.12),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.white.withOpacity(0.06)
                    : Colors.black.withOpacity(0.2),
                blurRadius: _isHovered ? 12 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            "Let's Talk",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

