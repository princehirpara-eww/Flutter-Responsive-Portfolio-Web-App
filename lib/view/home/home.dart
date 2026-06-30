import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/certifications/certifications.dart';
import 'package:flutter_portfolio/view/intro/introduction.dart';
import 'package:flutter_portfolio/view/main/main_view.dart';
import 'package:flutter_portfolio/view/projects/project_view.dart';
import 'package:flutter_portfolio/view/resume/resume_view.dart';

import '../about_us/about_us.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainView(pages: [
      const Introduction(),
      const AboutUs(),
      const ResumeView(),
      ProjectsView(),
      // Certifications(),
    ]);
  }
}
