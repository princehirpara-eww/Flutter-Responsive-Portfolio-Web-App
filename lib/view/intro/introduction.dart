import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/glowing_background.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'components/intro_body.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isLargeMobile(context) || Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GlowingBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 60.0,
          ),
          child: const IntroBody(),
        ),
      ),
    );
  }
}




