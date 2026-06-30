import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A reusable wrapper that handles the background layout and your page content
class BackgroundWrapper extends StatelessWidget {
  final String imagePath;
  final AlignmentGeometry alignment;
  final BoxFit fit;

  const BackgroundWrapper({
    super.key,
    required this.imagePath,
    required this.alignment,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. The Background Image
        Positioned.fill(
          child: Image.asset(
            imagePath, // Ensure this path matches your pubspec.yaml
            fit: fit,
            alignment: alignment,
          ),
        ),

        // 2. A subtle dark overlay (Optional but highly recommended for text readability)
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}