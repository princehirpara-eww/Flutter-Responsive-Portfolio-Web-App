import 'package:flutter/material.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import '../intro/components/background_wrapper.dart';
import 'components/skills_column.dart';
import 'components/timeline_column.dart';
import 'components/info_column.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // 1. Consistent dark-theme background wrapper
          Responsive(
            // Extra Large Screens (4K / Large Monitors)
            extraLargeScreen: const BackgroundWrapper(
              imagePath: 'assets/images/resume_bg.png',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),

            // Standard Desktop
            desktop: const BackgroundWrapper(
              imagePath: 'assets/images/resume_bg.png',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),

            // Tablets
            tablet: const BackgroundWrapper(
              imagePath: 'assets/images/resume_bg.png',
              alignment: Alignment.centerRight, // Shift view slightly to the right
              fit: BoxFit.cover,
            ),

            // Large Mobile Screens
            largeMobile: const BackgroundWrapper(
              imagePath: 'assets/images/resume_bg.png',
              alignment: Alignment.centerRight, // Keeps the desk setup visible
              fit: BoxFit.cover,
            ),

            // Small Mobile Screens
            mobile: const BackgroundWrapper(
              imagePath: 'assets/images/resume_bg.png',
              alignment: Alignment.bottomRight, // Targets the laptop/keyboard cluster perfectly
              fit: BoxFit.cover,
            ),
          ),

          // 2. Foreground content layout with safe margin for top navigation bar
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isLargeMobile(context) ? 20.0 : 60.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Margin to prevent overlapping with the navigation bar
                    SizedBox(height: size.height * 0.15),
                    
                    // Main Title
                    Text(
                      'MY RESUME',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 80,
                      height: 3,
                      color: flutterBlue,
                    ),
                    const SizedBox(height: defaultPadding * 2),

                    // Responsive 3-Column / 2-Column / 1-Column Layout
                    Responsive(
                      desktop: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SkillsColumn(),
                          ),
                          const SizedBox(width: defaultPadding * 3),
                          const Expanded(
                            flex: 4,
                            child: TimelineColumn(),
                          ),
                          const SizedBox(width: defaultPadding * 3),
                          const Expanded(
                            flex: 3,
                            child: InfoColumn(),
                          ),
                        ],
                      ),
                      extraLargeScreen: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SkillsColumn(),
                          ),
                          const SizedBox(width: defaultPadding * 3),
                          const Expanded(
                            flex: 4,
                            child: TimelineColumn(),
                          ),
                          const SizedBox(width: defaultPadding * 3),
                          const Expanded(
                            flex: 3,
                            child: InfoColumn(),
                          ),
                        ],
                      ),
                      tablet: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: TimelineColumn(),
                          ),
                          const SizedBox(width: defaultPadding * 2),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const SkillsColumn(),
                                const SizedBox(height: defaultPadding * 2),
                                const InfoColumn(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      largeMobile: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SkillsColumn(),
                          const SizedBox(height: defaultPadding * 2),
                          const TimelineColumn(),
                          const SizedBox(height: defaultPadding * 2),
                          const InfoColumn(),
                        ],
                      ),
                      mobile: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SkillsColumn(),
                          const SizedBox(height: defaultPadding * 2),
                          const TimelineColumn(),
                          const SizedBox(height: defaultPadding * 2),
                          const InfoColumn(),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: defaultPadding * 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
