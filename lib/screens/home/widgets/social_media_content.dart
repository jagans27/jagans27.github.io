import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/models/social_media_content_model.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:portfolio/utils/utils.dart';

class SocialMediaContent extends StatelessWidget {
  final SocialMediaContentModel socialMediaContent;
  final bool showText;
  final double iconSize;
  final double textSize;
  const SocialMediaContent({
    super.key,
    required this.socialMediaContent,
    required this.showText,
    required this.iconSize,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Utils.launchURL(
            url: socialMediaContent.url,
            subject: socialMediaContent.subject,
            body: socialMediaContent.body,
          );
        },
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              socialMediaContent.iconPath,
              width: iconSize,
              height: iconSize,
            ),
            SizedBox(width: 7),
            if (showText)
              Text(
                socialMediaContent.title,
                style: AppTextStyles.lineMenu.merge(
                  TextStyle(color: AppColors.white, fontSize: textSize),
                ),
              ),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
