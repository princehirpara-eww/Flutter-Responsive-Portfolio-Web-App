import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/res/constants.dart';

import '../../../view model/responsive.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.prefix, required this.title});

  final String prefix;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$prefix ',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.white,
              fontSize: !Responsive.isDesktop(context)
                  ? Responsive.isLargeMobile(context)
                      ? 20
                      : 30
                  : 50,
              fontWeight: FontWeight.bold),
        ),
        kIsWeb && Responsive.isDesktop(context)
            ? ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.androidGreen,
                        AppColors.flutterBlue,
                      ]).createShader(bounds);
                },
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: !Responsive.isDesktop(context)
                          ? Responsive.isLargeMobile(context)
                              ? 20
                              : 30
                          : 50,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.white,
                    fontSize: !Responsive.isDesktop(context)
                        ? Responsive.isLargeMobile(context)
                            ? 20
                            : 30
                        : 50,
                    fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
