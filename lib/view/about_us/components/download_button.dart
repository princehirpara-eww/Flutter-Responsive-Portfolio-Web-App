import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../res/constants.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final scale = isPressed
        ? 0.95
        : isHovered
        ? 1.01
        : 1.0;

    final translateY = isPressed
        ? 0.0
        : isHovered
        ? -1.0
        : 0.0;

    final animationDuration = 50;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() {
        isHovered = false;
        isPressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        onTap: () async {
          setState(() {
            isHovered = false;
            isPressed = false;
          });
          launchUrl(
            Uri.parse(
              'https://drive.google.com/file/d/1HSIe7rdk8VtrAL4DQuybfMHQgDrQ6xNs/view?usp=sharing',
            ),
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: animationDuration),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, translateY)
            ..scale(scale),
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 1.5,
            horizontal: defaultPadding * 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [AppColors.androidGreen, AppColors.flutterBlue],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.androidGreen.withValues(
                  alpha: isHovered ? 0.8 : 0.4,
                ),
                offset: const Offset(-2, 0),
                blurRadius: isHovered ? 10 : 5,
              ),
              BoxShadow(
                color: AppColors.flutterBlue.withValues(
                  alpha: isHovered ? 0.8 : 0.4,
                ),
                offset: const Offset(2, 0),
                blurRadius: isHovered ? 10 : 5,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Download CV',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: defaultPadding / 3),
              AnimatedRotation(
                duration: Duration(milliseconds: animationDuration),
                turns: isHovered ? 0.05 : 0,
                child: const FaIcon(
                  FontAwesomeIcons.download,
                  color: Colors.white70,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}