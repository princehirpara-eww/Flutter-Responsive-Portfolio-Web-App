import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.behance,
                onTap: () => launchUrl(Uri.parse('https://www.behance.net')),
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.facebookF,
                onTap: () => launchUrl(Uri.parse('https://www.facebook.com')),
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.linkedinIn,
                onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/hamad-anwar/')),
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.pinterestP,
                onTap: () => launchUrl(Uri.parse('https://www.pinterest.com')),
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.twitter,
                onTap: () => launchUrl(Uri.parse('https://twitter.com')),
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.instagram,
                onTap: () => launchUrl(Uri.parse('https://www.instagram.com')),
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.whatsapp,
                onTap: () => launchUrl(Uri.parse('https://wa.me/03054200605')),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final FaIconData icon;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
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
          scale: _isHovered ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedOpacity(
            opacity: _isHovered ? 1.0 : 0.65,
            duration: const Duration(milliseconds: 150),
            child: FaIcon(
              widget.icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
