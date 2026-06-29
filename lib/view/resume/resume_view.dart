import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/glowing_background.dart';
import '../../core/theme/app_colors.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/skills_column.dart';
import 'components/timeline_column.dart';
import 'components/info_column.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final isMobile = Responsive.isLargeMobile(context) || Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GlowingBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 60.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Margin to prevent overlapping with the sticky navigation bar
                SizedBox(height: size.height * 0.15),
                
                // Main Title
                Text(
                  'MY RESUME',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                        fontFamily: 'Poppins',
                      ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 3,
                  color: AppColors.white,
                ),
                const SizedBox(height: defaultPadding * 2),

                // Responsive 3-Column / 2-Column / 1-Column Layout
                Responsive(
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: GlassCard(child: SkillsColumn()),
                      ),
                      const SizedBox(width: defaultPadding * 1.5),
                      const Expanded(
                        flex: 4,
                        child: GlassCard(child: TimelineColumn()),
                      ),
                      const SizedBox(width: defaultPadding * 1.5),
                      const Expanded(
                        flex: 3,
                        child: GlassCard(child: InfoColumn()),
                      ),
                    ],
                  ),
                  extraLargeScreen: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: GlassCard(child: SkillsColumn()),
                      ),
                      const SizedBox(width: defaultPadding * 1.5),
                      const Expanded(
                        flex: 4,
                        child: GlassCard(child: TimelineColumn()),
                      ),
                      const SizedBox(width: defaultPadding * 1.5),
                      const Expanded(
                        flex: 3,
                        child: GlassCard(child: InfoColumn()),
                      ),
                    ],
                  ),
                  tablet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: GlassCard(child: TimelineColumn()),
                      ),
                      const SizedBox(width: defaultPadding * 1.5),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            const GlassCard(child: SkillsColumn()),
                            const SizedBox(height: defaultPadding * 1.5),
                            const GlassCard(child: InfoColumn()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  largeMobile: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlassCard(child: SkillsColumn()),
                      const SizedBox(height: defaultPadding * 1.5),
                      const GlassCard(child: TimelineColumn()),
                      const SizedBox(height: defaultPadding * 1.5),
                      const GlassCard(child: InfoColumn()),
                    ],
                  ),
                  mobile: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlassCard(child: SkillsColumn()),
                      const SizedBox(height: defaultPadding * 1.5),
                      const GlassCard(child: TimelineColumn()),
                      const SizedBox(height: defaultPadding * 1.5),
                      const GlassCard(child: InfoColumn()),
                    ],
                  ),
                ),
                
                const SizedBox(height: defaultPadding * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
