import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'components/drawer/drawer.dart';
import 'components/mobile_floating_nav.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPage = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_pageListener);
  }

  @override
  void dispose() {
    controller.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    if (controller.hasClients) {
      final page = controller.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    }
  }

  bool _canScrollDown() {
    if (_currentPage == 0) return true; // Intro section is not scrollable

    ScrollController? activeScrollController;
    if (_currentPage == 1) activeScrollController = aboutScrollController;
    if (_currentPage == 2) activeScrollController = resumeScrollController;
    if (_currentPage == 3) activeScrollController = projectsScrollController;

    if (activeScrollController == null || !activeScrollController.hasClients) {
      return true;
    }

    return activeScrollController.position.pixels >=
        activeScrollController.position.maxScrollExtent - 2.0;
  }

  bool _canScrollUp() {
    if (_currentPage == 0) return true; // Intro section is not scrollable

    ScrollController? activeScrollController;
    if (_currentPage == 1) activeScrollController = aboutScrollController;
    if (_currentPage == 2) activeScrollController = resumeScrollController;
    if (_currentPage == 3) activeScrollController = projectsScrollController;

    if (activeScrollController == null || !activeScrollController.hasClients) {
      return true;
    }

    return activeScrollController.position.pixels <=
        activeScrollController.position.minScrollExtent + 2.0;
  }

  void _snapToPage(int targetPage) {
    if (_isAnimating) return;
    if (targetPage < 0 || targetPage >= widget.pages.length) return;

    setState(() {
      _isAnimating = true;
    });

    controller
        .animateToPage(
      targetPage,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    )
        .then((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          setState(() {
            _isAnimating = false;
          });
        }
      });
    });
  }

  void _handlePointerScroll(PointerScrollEvent event) {
    if (_isAnimating) return;

    // Filter out very small scroll deltas to avoid accidental hair-trigger scrolling
    if (event.scrollDelta.dy.abs() < 10) return;

    if (event.scrollDelta.dy > 0) {
      // Scroll Down -> Next Page
      if (!_canScrollDown()) return; // Let the child scroll internally
      _snapToPage(_currentPage + 1);
    } else if (event.scrollDelta.dy < 0) {
      // Scroll Up -> Previous Page
      if (!_canScrollUp()) return; // Let the child scroll internally
      _snapToPage(_currentPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 850;
    const scrollPhysics = NeverScrollableScrollPhysics();

    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                // If a child scrollable view (depth > 0) has reached its limits and overscrolls,
                // programmatically snap to the next/previous page.
                if (notification.depth > 0 && notification is OverscrollNotification) {
                  if (notification.overscroll > 0) {
                    // Overscrolled at the bottom -> Go to next page
                    _snapToPage(_currentPage + 1);
                  } else if (notification.overscroll < 0) {
                    // Overscrolled at the top -> Go to previous page
                    _snapToPage(_currentPage - 1);
                  }
                }
                return false; // Allow notifications to propagate
              },
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  if (isDesktop) return; // Only process swipes on mobile layout
                  if (_isAnimating) return;

                  // Drag velocity: negative = dragged up (swipe up -> next page), positive = dragged down (swipe down -> previous page)
                  final velocity = details.primaryVelocity ?? 0.0;
                  if (velocity < -100) {
                    _snapToPage(_currentPage + 1);
                  } else if (velocity > 100) {
                    _snapToPage(_currentPage - 1);
                  }
                },
                child: Listener(
                  onPointerSignal: (pointerSignal) {
                    if (pointerSignal is PointerScrollEvent) {
                      _handlePointerScroll(pointerSignal);
                    }
                  },
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: scrollPhysics,
                    controller: controller,
                    children: widget.pages,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TopNavigationBar(activeIndex: _currentPage),
                ],
              ),
            ),
            if (MediaQuery.sizeOf(context).width <= 850)
              MobileFloatingNav(
                activeIndex: _currentPage,
                onTabSelect: (index) {
                  controller.jumpToPage(index);
                },
              ),
          ],
        ),
      ),
    );
  }
}








