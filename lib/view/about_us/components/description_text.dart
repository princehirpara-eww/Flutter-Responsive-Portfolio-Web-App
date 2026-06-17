import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          'Passionate Mobile Application Developer with 4.5+ years of experience in Android and Flutter development. Skilled in building scalable, high-performance mobile applications using Kotlin, Java, Flutter, and Dart. Experienced in developing customer, driver, and vendor applications across ride-hailing, logistics, healthcare, marketplace, and container rental domains. Strong expertise in MVVM architecture, REST API integration, Google Maps, Firebase, payment gateways, real-time tracking, and chat modules. Proven ability to deliver production-ready applications and manage deployments on Google Play Store and Apple App Store.',
          // 'Passionate Mobile Application Developer with 4.5+ years of${Responsive.isLargeMobile(context) ? '\n' : ''}experience in ${!Responsive.isLargeMobile(context) ? '\n' : ''}Android and Flutter development. Skilled in building scalable,${Responsive.isLargeMobile(context) ? '\n' : ''}high-performance ${!Responsive.isLargeMobile(context) ? '\n' : ''}mobile applications using Kotlin, Java, Flutter, and Dart.${Responsive.isLargeMobile(context) ? '\n' : ''} Experienced in ${!Responsive.isLargeMobile(context) ? '\n' : ''}developing customer, driver, and vendor applications across${Responsive.isLargeMobile(context) ? '\n' : ''}ride-hailing, ${!Responsive.isLargeMobile(context) ? '\n' : ''}logistics, healthcare, marketplace, and container rental${Responsive.isLargeMobile(context) ? '\n' : ''}domains. Strong ${!Responsive.isLargeMobile(context) ? '\n' : ''}expertise in MVVM architecture, REST API integration,${Responsive.isLargeMobile(context) ? '\n' : ''}Google Maps, Firebase, ${!Responsive.isLargeMobile(context) ? '\n' : ''}payment gateways, real-time tracking, and chat modules.${Responsive.isLargeMobile(context) ? '\n' : ''}Proven ability to ${!Responsive.isLargeMobile(context) ? '\n' : ''}deliver production-ready applications and manage deployments${Responsive.isLargeMobile(context) ? '\n' : ''}on Google Play Store ${!Responsive.isLargeMobile(context) ? '\n' : ''}and Apple App Store.',
          // 'I\'m capable of creating excellent mobile apps, handling${Responsive.isLargeMobile(context) ? '\n' : ''}every step from ${!Responsive.isLargeMobile(context) ? '\n' : ''}concept to deployment.',
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}