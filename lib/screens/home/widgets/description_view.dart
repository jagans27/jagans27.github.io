import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/screens/home/widgets/multi_highlight_text.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiHighlightText(
      text: Constants.welcomeDescription.text,
      highlights: {
        for (var highlight in Constants.welcomeDescription.highlights)
          highlight: AppTextStyles.paragraph.merge(
            TextStyle(color: AppColors.white),
          ),
      },
      defaultStyle: AppTextStyles.paragraph.merge(
        TextStyle(color: AppColors.paragraph),
      ),
    );
  }
}
