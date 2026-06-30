import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../res/constants.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // WHAT CAN I DO? (SERVICES) SECTION
        _buildSectionHeader(context, 'WHAT CAN I DO ?'),
        const SizedBox(height: defaultPadding),
        _buildTextServiceRow(context, 'Mobile App Development (Android & iOS)'),
        _buildTextServiceRow(context, 'Custom UI/UX Implementation'),
        _buildTextServiceRow(context, 'State Management & Architecture'),
        _buildTextServiceRow(context, 'API Integration & Payment Gateways'),
        _buildTextServiceRow(context, 'Google Play & App Store Deployments'),
        
        const SizedBox(height: defaultPadding * 2),

        // TECHNICAL / DESIGN SKILLS
        _buildSectionHeader(context, 'DEVELOPMENT SPECIALTIES'),
        const SizedBox(height: defaultPadding),
        _buildSpecialtyRow(context, 'Clean Architecture  •  MVVM & Clean Code'),
        _buildSpecialtyRow(context, 'Live Tracking  •  Google Maps API'),
        _buildSpecialtyRow(context, 'Real-time Chat  •  Socket.io & WebSockets'),
        _buildSpecialtyRow(context, 'Push Notifications  •  Firebase Cloud Messaging'),
        _buildSpecialtyRow(context, 'Mobile Scanning  •  QR & Barcode Readers'),

        const SizedBox(height: defaultPadding * 2),

        // HOBBIES & INTERESTS SECTION
        _buildSectionHeader(context, 'HOBBIES & INTERESTS'),
        const SizedBox(height: defaultPadding),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            _buildHobbyItem(context, FontAwesomeIcons.bookOpen, 'Reading'),
            _buildHobbyItem(context, FontAwesomeIcons.camera, 'Photography'),
            _buildHobbyItem(context, FontAwesomeIcons.gamepad, 'Gaming'),
            _buildHobbyItem(context, FontAwesomeIcons.music, 'Music'),
            _buildHobbyItem(context, FontAwesomeIcons.planeDeparture, 'Travel'),
          ],
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
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 40,
          height: 2.5,
          color: AppColors.flutterBlue,
        ),
      ],
    );
  }

  Widget _buildTextServiceRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: Colors.white12,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtyRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: FaIcon(
              FontAwesomeIcons.circleCheck,
              size: 13,
              color: AppColors.flutterBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white70,
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHobbyItem(BuildContext context, FaIconData icon, String label) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.darkSurface,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: FaIcon(
              icon,
              size: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white70,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
