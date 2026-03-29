import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/styles/app_assets.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:portfolio/routes/pages.dart';
import 'package:go_router/go_router.dart';

class PageNotFoundDesktopScreen extends StatefulWidget {
  const PageNotFoundDesktopScreen({super.key});

  @override
  State<PageNotFoundDesktopScreen> createState() =>
      _PageNotFoundDesktopScreenState();
}

class _PageNotFoundDesktopScreenState extends State<PageNotFoundDesktopScreen> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Lottie.asset(
                  AppAssets.pageNotFound,
                  repeat: false,
                  animate: false,
                ),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Page Not Found',
              style: AppTextStyles.cardTitle.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isHovering = true),
              onExit: (_) => setState(() => _isHovering = false),

              child: GestureDetector(
                onTap: () {
                  context.go(Pages.homeScreen);
                },
                behavior: HitTestBehavior.translucent,
                child: Text(
                  'Back to Home',
                  style: AppTextStyles.menuTitle.copyWith(
                    decoration: TextDecoration.underline,
                    color: _isHovering
                        ? AppColors.blackPale
                        : AppColors.paragraph,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
