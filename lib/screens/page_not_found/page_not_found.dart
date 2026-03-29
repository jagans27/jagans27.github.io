import 'package:flutter/material.dart';
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:portfolio/screens/page_not_found/views/page_not_found_desktop_screen.dart';
import 'package:portfolio/screens/page_not_found/views/page_not_found_mobile_screen.dart';
import 'package:portfolio/screens/page_not_found/views/page_not_found_tablet_screen.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  Widget _getResponsiveScreen(BuildContext context) {
    if (Breakpoints.mobile.isBreakpoint(context)) {
      return const PageNotFoundMobileScreen();
    } else if (Breakpoints.tablet.isBreakpoint(context)) {
      return const PageNotFoundTabletScreen();
    } else {
      return PageNotFoundDesktopScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getResponsiveScreen(context);
  }
}
