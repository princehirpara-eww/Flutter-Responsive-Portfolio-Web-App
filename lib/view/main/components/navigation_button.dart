import 'package:flutter/material.dart';

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
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: isActive ? flutterBlue : Colors.white,
            ),
      ),
    );
  }
}
