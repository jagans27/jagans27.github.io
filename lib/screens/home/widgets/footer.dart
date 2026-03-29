import 'package:flutter/material.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  double _opacity = 0.0;
  double _offsetY = 50; // start slightly below

  void _animateIn() {
    setState(() {
      _opacity = 1.0;
      _offsetY = 0;
    });
  }

  void _animateOut() {
    setState(() {
      _opacity = 0.0;
      _offsetY = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('footer-visibility'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          _animateIn(); // animate when visible
        } else {
          _animateOut(); // hide when not visible
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: _opacity,
        curve: Curves.easeOut,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          offset: Offset(0, _offsetY / 100),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Inspired ",
                        style: TextStyle(color: AppColors.paragraph),
                      ),
                      TextSpan(
                        text: " • ",
                        style: TextStyle(color: AppColors.blackPale),
                      ),
                      TextSpan(
                        text: " Handcrafted ",
                        style: TextStyle(color: AppColors.paragraph),
                      ),
                      TextSpan(
                        text: " • ",
                        style: TextStyle(color: AppColors.blackPale),
                      ),
                      TextSpan(
                        text: " 2025",
                        style: TextStyle(color: AppColors.paragraph),
                      ),
                    ],
                    style: AppTextStyles.cardSubtitle,
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
