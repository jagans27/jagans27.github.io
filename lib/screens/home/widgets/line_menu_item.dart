import 'package:flutter/material.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';

class LineMenuItem extends StatelessWidget {
  final int index;
  final String title;
  final bool isSelected;
  final Function onTap;
  const LineMenuItem({
    super.key,
    required this.index,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            index.toString().padLeft(2, '0'),
            style: AppTextStyles.lineMenu.merge(
              TextStyle(
                color: isSelected ? AppColors.white : AppColors.paragraph,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ),
          const SizedBox(width: 10),
          AnimatedContainer(
            width: isSelected ? 70 : 50,
            height: 1,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.white : AppColors.paragraph,
              borderRadius: BorderRadius.circular(2.5),
            ),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          ),
          const SizedBox(width: 10),
          Text(
            title.toUpperCase(),
            style: AppTextStyles.lineMenu.merge(
              TextStyle(
                color: isSelected ? AppColors.white : AppColors.paragraph,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
