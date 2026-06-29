import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class NavigationTextButton extends StatefulWidget {
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
  State<NavigationTextButton> createState() => _NavigationTextButtonState();
}

class _NavigationTextButtonState extends State<NavigationTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w500,
                  color: (widget.isActive || _isHovered)
                      ? AppColors.white
                      : AppColors.white.withOpacity(0.6),
                ),
                child: Text(widget.text),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                height: 2.0,
                width: widget.isActive ? 24.0 : 0.0,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

