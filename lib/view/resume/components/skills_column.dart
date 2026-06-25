import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../res/constants.dart';

class SkillsColumn extends StatelessWidget {
  const SkillsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SOFTWARE SKILLS Section
        _buildSectionHeader(context, 'TECHNICAL SKILLS'),
        const SizedBox(height: defaultPadding),
        _buildSkillRow(
          context,
          'Flutter',
          0.95,
          FontAwesomeIcons.flutter,
          flutterBlue,
        ),
        _buildSkillRow(
          context,
          'Dart',
          0.95,
          FontAwesomeIcons.code,
          flutterBlue,
        ),
        _buildSkillRow(
          context,
          'Kotlin',
          0.90,
          FontAwesomeIcons.android,
          androidGreen,
        ),
        _buildSkillRow(
          context,
          'Java',
          0.80,
          FontAwesomeIcons.java,
          Colors.orange,
        ),
        _buildSkillRow(
          context,
          'Android SDK',
          0.90,
          FontAwesomeIcons.mobileScreenButton,
          androidGreen,
        ),
        _buildSkillRow(
          context,
          'State Management',
          0.85,
          FontAwesomeIcons.layerGroup,
          flutterBlue,
        ),
        
        const SizedBox(height: defaultPadding * 2),

        // LANGUAGES Section
        _buildSectionHeader(context, 'LANGUAGES'),
        const SizedBox(height: defaultPadding),
        _buildLanguageRow(context, 'English', 0.90),
        _buildLanguageRow(context, 'Hindi', 1.0),
        _buildLanguageRow(context, 'Gujarati', 1.0),

        const SizedBox(height: defaultPadding * 2),

        // PERSONAL SKILLS Section
        _buildSectionHeader(context, 'PERSONAL SKILLS'),
        const SizedBox(height: defaultPadding),
        Text(
          'Creativity  •  Team Work  •  Organisation  •  Problem Solving',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white70,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 40,
          height: 2.5,
          color: flutterBlue,
        ),
      ],
    );
  }

  Widget _buildSkillRow(
    BuildContext context,
    String skill,
    double value,
    FaIconData icon,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white12),
            ),
            child: FaIcon(
              icon,
              size: 15,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 130,
            child: Text(
              skill,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Expanded(
            child: _CustomSlider(value: value, color: iconColor),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageRow(BuildContext context, String language, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              language,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _CustomSlider(value: value, color: flutterBlue),
          ),
        ],
      ),
    );
  }
}

class _CustomSlider extends StatelessWidget {
  final double value;
  final Color color;

  const _CustomSlider({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background track
        Container(
          height: 2,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        // Active progress line
        Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: value,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ),
        // Handle dot at current progress position
        Align(
          alignment: Alignment(value * 2 - 1, 0),
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
