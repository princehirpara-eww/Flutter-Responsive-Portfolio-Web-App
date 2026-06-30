import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding/2,),
        AreaInfoText(title: 'Contact', text: '1234554321'),
        AreaInfoText(title: 'Email', text: 'prince.eww@gmail.com'),
        AreaInfoText(title: 'LinkedIn', text: '@prince-eww'),
        AreaInfoText(title: 'Github', text: '@prince-eww'),
        SizedBox(
          height: defaultPadding,
        ),
        Text('Skills',style: TextStyle(color: AppColors.white),),
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
