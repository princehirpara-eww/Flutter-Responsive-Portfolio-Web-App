import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../res/constants.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isActive;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    /*return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontSize: size.height * 0.019,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.flutterBlue : AppColors.white,
            ),
      ),
    );*/
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: size.height * 0.02,
          vertical: size.height * 0.01
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: size.height * 0.02,
            fontWeight: FontWeight.bold,
            color: isActive ? AppColors.flutterBlue : AppColors.white,
          ),
        ),
      ),
    );
  }
}
