import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:portfolio/utils/utils.dart';

class ResumePreviewButton extends StatelessWidget {
  const ResumePreviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Utils.launchURL(url: Constants.resumeLink);
      },
      style:
          TextButton.styleFrom(
            backgroundColor: AppColors.cardBackground,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            shape: const RoundedRectangleBorder(),
            elevation: 0,
            enableFeedback: true,
            overlayColor: AppColors.cardBackground,
            shadowColor: Colors.transparent,
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.cardBackground;
              }
              return AppColors.cardBackground;
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.paragraph;
              }
              return AppColors.blackPale;
            }),
          ),
      child: Text(
        "Resume Snapshot".toUpperCase(),
        style: AppTextStyles.menuTitle,
      ),
    );
  }
}
