import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ImageViewer {
  ImageViewer(BuildContext context, String image) {
    showGeneralDialog(
      barrierColor: Colors.black,
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: 'Barrier',
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Hero(
            tag: 'IMAGEVIEW',
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                    color: AppColors.white,
                    child: Center(
                      child: PhotoView(imageProvider: AssetImage(image))
                      ),
                    )),
              ),
            ),

        );
      },
    );
  }
}
