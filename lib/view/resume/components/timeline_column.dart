import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class TimelineColumn extends StatelessWidget {
  const TimelineColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // EXPERIENCE SECTION
        _buildSectionHeader(context, 'WORK EXPERIENCE'),
        const SizedBox(height: defaultPadding),
        
        _buildTimelineItem(
          context,
          badgeTextTop: '2022',
          badgeTextBottom: 'Present',
          company: 'EXCELLENT WEB WORLD',
          role: 'Android & Flutter Developer',
          description: '• Developed Android & Flutter applications for international clients across logistics, transportation, and healthcare.\n'
              '• Integrated Stripe, Moyasar, PayTabs payment gateways.\n'
              '• Implemented Google Maps, live tracking, real-time chat (Socket.io), and push notifications.',
          isLast: false,
        ),
        
        _buildTimelineItem(
          context,
          badgeTextTop: '2021',
          badgeTextBottom: '2022',
          company: 'HASHTECHY TECHNOLOGY',
          role: 'Android Developer',
          description: '• Built native Android applications using Kotlin and Java.\n'
              '• Managed databases, API integrations, and resolved key bugs/issues.\n'
              '• Collaborated with QA teams to deliver stable and performant releases.',
          isLast: false,
        ),
        
        _buildTimelineItem(
          context,
          badgeTextTop: '2021',
          badgeTextBottom: '2021',
          company: 'MAXGEN TECHNOLOGIES',
          role: 'Jr. Android Developer',
          description: '• Learned core Android development principles and app architecture.\n'
              '• Assisted in UI implementation, API integrations, and debugging.',
          isLast: true,
        ),
        
        const SizedBox(height: defaultPadding * 2),

        // EDUCATION SECTION
        _buildSectionHeader(context, 'EDUCATION'),
        const SizedBox(height: defaultPadding),
        
        _buildTimelineItem(
          context,
          badgeTextTop: '2017',
          badgeTextBottom: '2021',
          company: 'APOLLO INSTITUTE OF ENGINEERING & TECH',
          role: 'Bachelor of Computer Engineering',
          description: '• Studied software development methodologies, databases, and network architectures.\n'
              '• Completed projects focused on mobile application design.',
          isLast: true,
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

  Widget _buildTimelineItem(
    BuildContext context, {
    required String badgeTextTop,
    required String badgeTextBottom,
    required String company,
    required String role,
    required String description,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left portion: circular badge & vertical connecting line
          Column(
            children: [
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: darkColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: flutterBlue, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: flutterBlue.withOpacity(0.15),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      badgeTextTop,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    const Text(
                      'to',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 8,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      badgeTextBottom,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white12,
                  ),
                ),
              if (isLast)
                const SizedBox(height: 16),
            ],
          ),
          const SizedBox(width: 20),
          // Right portion: content cards/details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  role,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: bodyTextColor,
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 24), // spacing below each item
              ],
            ),
          ),
        ],
      ),
    );
  }
}
