import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Text('Check on Github',style: TextStyle(color: AppColors.white),overflow: TextOverflow.ellipsis),
            IconButton(onPressed: () {launchUrl(Uri.parse(projectList[index].link));}, icon: SvgPicture.asset('assets/icons/github.svg')),
          ],
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              launchUrl(Uri.parse(projectList[index].link));
            }, child: Text('Read More>>',overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.flutterBlue,fontWeight: FontWeight.bold,fontSize: 10),))
      ],
    );
  }
}
