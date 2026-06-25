import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import '../../view model/responsive.dart';
import 'components/navigation_button_list.dart';
class MainView extends StatefulWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPage = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomDrawer(),
      body: Center(
        child: Stack(
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: widget.pages,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TopNavigationBar(activeIndex: _currentPage),
                  // if (Responsive.isLargeMobile(context))
                  //   Row(
                  //     children: [
                  //       const Spacer(),
                  //       NavigationButtonList(activeIndex: _currentPage),
                  //       const Spacer(),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}








