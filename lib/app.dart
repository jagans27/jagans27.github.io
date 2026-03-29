import 'package:flutter/material.dart';
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:portfolio/routes/routes.dart';
import 'package:portfolio/styles/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
      ),
      builder: (context, child) =>
          FlutterBreakpointProvider.builder(context: context, child: child),
    );
  }
}
