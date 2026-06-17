import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/intro/components/side_menu_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNavigationBar extends StatelessWidget {
  final int activeIndex;
  const TopNavigationBar({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 2,
        vertical: defaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (Responsive.isLargeMobile(context))
            MenuButton(onTap: () => Scaffold.of(context).openDrawer())
          else
            NavigationButtonList(activeIndex: activeIndex),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launchUrl(Uri.parse('tel:7745553021')),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: Colors.white70,
                    size: 15,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '774-555-3021',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
