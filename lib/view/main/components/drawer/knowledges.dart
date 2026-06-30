import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Knowledge',style: TextStyle(color: AppColors.white),),
        ),
        KnowledgeText(knowledge: 'Android, Flutter'),
        KnowledgeText(knowledge: 'Java, Kotlin, Dart'),
        KnowledgeText(knowledge: 'Jetpack Compose, Navigation Graph'),
        KnowledgeText(knowledge: 'Git, Github'),
      ],
    );
  }

}
