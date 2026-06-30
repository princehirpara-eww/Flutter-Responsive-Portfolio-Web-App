import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../view model/responsive.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final isMobile = Responsive.isLargeMobile(context) || Responsive.isMobile(context);

    // Padding for sticky top nav bar
    final double topSpacing = size.height * 0.14;

    if (isMobile) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topSpacing),
            // Profile image on top for mobile
            Center(
              child: _buildAvatar(size.width * 0.55 > 250 ? 250 : size.width * 0.55),
            ),
            const SizedBox(height: 32),
            // Intro text details below
            _buildTextDetails(context, isMobile: true),
            const SizedBox(height: 40),
          ],
        ),
      );
    }

    // Desktop/Tablet Row Layout
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column (Text & Buttons)
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: topSpacing * 0.6),
                _buildTextDetails(context, isMobile: false),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const SizedBox(width: 40),
        // Right Column (Profile Picture)
        Expanded(
          flex: 3,
          child: Center(
            child: _buildAvatar(size.width * 0.28 > 320 ? 320 : size.width * 0.28),
          ),
        ),
      ],
    );
  }

  Widget _buildTextDetails(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subtitle
        Text(
          'I am Prince Hirpara',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white.withOpacity(0.85),
            fontWeight: FontWeight.w500,
            fontSize: isMobile ? 16 : 22,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12),
        // Main Title
        Text(
          'Flutter & Android\nDeveloper',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: isMobile ? 32 : 54,
            height: 1.15,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 20),
        // Description
        Text(
          'Building premium, high-performance mobile and web applications with Flutter and Android to deliver seamless user experiences.',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white.withOpacity(0.65),
            fontWeight: FontWeight.w400,
            fontSize: isMobile ? 14 : 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),
        // CV Button
        const _DownloadCVButton(),
        const SizedBox(height: 32),
        // Social Media Links
        const _SocialMediaRowInline(),
      ],
    );
  }

  Widget _buildAvatar(double dimension) {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.04),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.18),
            blurRadius: 40,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/avatar_hp.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _DownloadCVButton extends StatefulWidget {
  const _DownloadCVButton();

  @override
  State<_DownloadCVButton> createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<_DownloadCVButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(
            Uri.parse(
              'https://drive.google.com/file/d/1HSIe7rdk8VtrAL4DQuybfMHQgDrQ6xNs/view?usp=sharing',
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white.withOpacity(0.12) : Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _isHovered ? Colors.white.withOpacity(0.25) : Colors.white.withOpacity(0.12),
              width: 1.2,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Download CV',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.download_rounded,
                color: Colors.white.withOpacity(0.8),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialMediaRowInline extends StatelessWidget {
  const _SocialMediaRowInline();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIconInline(
          icon: FontAwesomeIcons.linkedinIn,
          onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/prince-eww')),
        ),
        const SizedBox(width: 24),
        _SocialIconInline(
          icon: FontAwesomeIcons.github,
          onTap: () => launchUrl(Uri.parse('https://github.com/prince-eww')),
        ),
      ],
    );
  }
}

class _SocialIconInline extends StatefulWidget {
  final FaIconData icon;
  final VoidCallback onTap;

  const _SocialIconInline({
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialIconInline> createState() => _SocialIconInlineState();
}

class _SocialIconInlineState extends State<_SocialIconInline> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.25 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedOpacity(
            opacity: _isHovered ? 1.0 : 0.6,
            duration: const Duration(milliseconds: 150),
            child: FaIcon(
              widget.icon,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
