import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  final int activeIndex;
  const NavigationButtonList({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(
                onTap: () {
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Home',
                isActive: activeIndex == 0,
              ),
              NavigationTextButton(
                onTap: () {
                  controller.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'About',
                isActive: activeIndex == 1,
              ),
              NavigationTextButton(
                onTap: () {
                  controller.animateToPage(3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Resume',
                isActive: activeIndex == 3,
              ),
              NavigationTextButton(
                onTap: () {
                  controller.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Projects',
                isActive: activeIndex == 2,
              ),
            ],
          ),
        );
      },
    );
  }
}