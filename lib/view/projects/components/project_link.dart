import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GithubLink(url: projectList[index].link),
        const Spacer(),
        _ReadMoreLink(url: projectList[index].link),
      ],
    );
  }
}

class _GithubLink extends StatefulWidget {
  final String url;
  const _GithubLink({required this.url});

  @override
  State<_GithubLink> createState() => _GithubLinkState();
}

class _GithubLinkState extends State<_GithubLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedScale(
          scale: _isHovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Check on Github',
                style: TextStyle(
                  color: _isHovered ? AppColors.flutterBlue : AppColors.white,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
                  decorationColor: AppColors.flutterBlue,
                ),
              ),
              const SizedBox(width: 6),
              SvgPicture.asset(
                'assets/icons/github.svg',
                colorFilter: ColorFilter.mode(
                  _isHovered ? AppColors.flutterBlue : AppColors.white,
                  BlendMode.srcIn,
                ),
                width: 18,
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReadMoreLink extends StatefulWidget {
  final String url;
  const _ReadMoreLink({required this.url});

  @override
  State<_ReadMoreLink> createState() => _ReadMoreLinkState();
}

class _ReadMoreLinkState extends State<_ReadMoreLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.only(left: _isHovered ? 4.0 : 0.0),
          child: Text(
            'Read More >>',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _isHovered ? Colors.white : AppColors.flutterBlue,
              fontWeight: FontWeight.bold,
              fontSize: 11,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
