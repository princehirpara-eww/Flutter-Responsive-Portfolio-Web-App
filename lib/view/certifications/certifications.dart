import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/glowing_background.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/getx_controllers/certification_controller.dart';
import '../../view model/responsive.dart';
import 'components/certification_grid.dart';

class Certifications extends StatelessWidget {
  final controller = Get.put(CertificationController());
  Certifications({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Safe spacing to clear the sticky top navigation bar
              SizedBox(height: size.height * 0.15),
              
              const TitleText(prefix: 'Certifications & ', title: 'License'),
              const SizedBox(height: defaultPadding),
              
              Expanded(
                child: Responsive(
                  desktop: CertificateGrid(crossAxisCount: 3, ratio: 1.5),
                  extraLargeScreen: CertificateGrid(crossAxisCount: 4, ratio: 1.6),
                  largeMobile: CertificateGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: CertificateGrid(crossAxisCount: 1, ratio: 1.4),
                  tablet: CertificateGrid(ratio: 1.7, crossAxisCount: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
