import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../res/constants.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(defaultPadding/6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              AppColors.androidGreen,
              AppColors.flutterBlue,
            ],
          ),
          boxShadow: [
            BoxShadow(color: AppColors.androidGreen,blurRadius: 10,offset: Offset(0, 2)),
            BoxShadow(color: AppColors.flutterBlue,blurRadius: 10,offset: Offset(0, -2)),
          ]
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Transform.rotate(
              angle: 0.1,
              child: Image.asset('assets/images/image.png',fit: BoxFit.cover,))),
    );
  }
}
