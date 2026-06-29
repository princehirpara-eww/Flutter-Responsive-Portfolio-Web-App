import 'package:flutter/material.dart';

class MobileFloatingNav extends StatefulWidget {
  final int activeIndex;
  final Function(int) onTabSelect;

  const MobileFloatingNav({
    super.key,
    required this.activeIndex,
    required this.onTabSelect,
  });

  @override
  State<MobileFloatingNav> createState() => _MobileFloatingNavState();
}

class _MobileFloatingNavState extends State<MobileFloatingNav> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final menuItems = ['Home', 'About', 'Resume', 'Portfolio'];

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      right: _isExpanded ? 0 : -95,
      top: size.height * 0.35,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isExpanded = true),
        onExit: (_) => setState(() => _isExpanded = false),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            width: 130,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF151515).withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.12),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(-2, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Pull Handle Indicator / Menu Icon (visible when collapsed)
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Icon(
                      _isExpanded ? Icons.chevron_right_rounded : Icons.menu_rounded,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Vertical Navigation Links
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(menuItems.length, (index) {
                      final isActive = widget.activeIndex == index || (index == 3 && (widget.activeIndex == 3 || widget.activeIndex == 4));
                      return GestureDetector(
                        onTap: () {
                          widget.onTabSelect(index);
                          setState(() {
                            _isExpanded = false;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.white.withOpacity(0.08) : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            menuItems[index],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                              color: isActive ? Colors.white : Colors.white.withOpacity(0.65),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
