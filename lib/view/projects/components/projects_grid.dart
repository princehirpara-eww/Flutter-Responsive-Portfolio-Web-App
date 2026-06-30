import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_info.dart';
import 'package:get/get.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import '../../../view model/responsive.dart';
import '../../main/components/entrance_fader.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3,  this.ratio=1.3});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isLargeMobile(context) ? 0.0 : 15.0,
      ),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        // Cascade delay based on index
        final delay = Duration(milliseconds: 100 + (index * 120));
        return EntranceFader(
          delay: delay,
          child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              transform: Matrix4.identity()..scale(controller.hovers[index] ? 1.03 : 1.0),
              transformAlignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                  vertical: defaultPadding, horizontal: defaultPadding),
              decoration: BoxDecoration(
                color: controller.hovers[index]
                    ? Colors.white.withOpacity(0.08)
                    : Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: controller.hovers[index]
                      ? Colors.white.withOpacity(0.20)
                      : Colors.white.withOpacity(0.08),
                  width: 1.2,
                ),
                boxShadow: [
                  if (controller.hovers[index])
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.12),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                ],
              ),
              child: ProjectStack(index: index)
          )),
        );
      },
    );
  }
}