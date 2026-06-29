import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/glowing_background.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:get/get.dart';
import 'components/projects_grid.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final isMobile = Responsive.isLargeMobile(context) || Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GlowingBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 60.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Margin to prevent overlapping with the navigation bar
                SizedBox(height: size.height * 0.15),
                
                // Main Title
                Text(
                  'MY PORTFOLIO',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                        fontFamily: 'Poppins',
                      ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 3,
                  color: AppColors.white,
                ),
                const SizedBox(height: defaultPadding * 2),

                // Grid layout of projects
                Responsive(
                  desktop: ProjectGrid(crossAxisCount: 3),
                  extraLargeScreen: ProjectGrid(crossAxisCount: 4),
                  largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                  tablet: ProjectGrid(ratio: 1.4, crossAxisCount: 2),
                ),

                const SizedBox(height: defaultPadding * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
