import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';

import 'components/background_wrapper.dart';
import 'components/intro_body.dart';
import 'components/social_media_row.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Responsive(
            // Extra Large Screens (4K / Large Monitors)
            extraLargeScreen: const BackgroundWrapper(
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),

            // Standard Desktop
            desktop: const BackgroundWrapper(
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),

            // Tablets
            tablet: const BackgroundWrapper(
              alignment: Alignment.centerRight, // Shift view slightly to the right
              fit: BoxFit.cover,
            ),

            // Large Mobile Screens
            largeMobile: const BackgroundWrapper(
              alignment: Alignment.centerRight, // Keeps the desk setup visible
              fit: BoxFit.cover,
            ),

            // Small Mobile Screens
            mobile: const BackgroundWrapper(
              alignment: Alignment.bottomRight, // Targets the laptop/keyboard cluster perfectly
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isLargeMobile(context) ? 20.0 : 60.0,
              ),
              child: const IntroBody(),
            ),
          ),
          if (!Responsive.isLargeMobile(context))
            const Positioned(
              bottom: 45,
              left: 60,
              child: SocialMediaRow(),
            ),
        ],
      ),
    );
  }
}



