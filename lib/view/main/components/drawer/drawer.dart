import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/view/main/components/drawer/contact_icons.dart';
import 'package:flutter_portfolio/view/main/components/drawer/personal_info.dart';
import '../../../../res/constants.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              color: AppColors.midnightBlack,
              child: const Padding(
              padding: EdgeInsets.all(defaultPadding/2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalInfo(),
                  MySKills(),
                  Knowledges(),
                  Divider(),
                  SizedBox(height: defaultPadding,),
                  ContactIcon(),
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




