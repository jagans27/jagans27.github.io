import 'package:flutter/material.dart';
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/home/views/home_desktop_screen.dart';
import 'package:portfolio/screens/home/views/home_mobile_screen.dart';
import 'package:portfolio/screens/home/views/home_tablet_screen.dart';

class HomeScreen extends StatelessWidget {
  final int initialIndex;
  const HomeScreen({super.key, required this.initialIndex});

  int _getCurrentIndex(String? tab) {
    switch (tab) {
      case 'project':
        return 1;
      case 'work':
        return 0;
      case '':
      case null:
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tab = GoRouterState.of(context).uri.queryParameters['tab'];
    final currentIndex = _getCurrentIndex(tab);

    return _getResponsiveScreen(context, currentIndex);
  }

  Widget _getResponsiveScreen(BuildContext context, int currentIndex) {
    if (Breakpoints.mobile.isBreakpoint(context)) {
      return const HomeMobileScreen();
    } else if (Breakpoints.tablet.isBreakpoint(context)) {
      return const HomeTabletScreen();
    } else {
      return HomeDesktopScreen(currentIndex: currentIndex);
    }
  }
}
