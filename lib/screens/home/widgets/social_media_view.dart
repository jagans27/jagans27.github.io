import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/screens/home/widgets/social_media_content.dart';
import 'package:portfolio/styles/app_colors.dart';

class SocialMediaView extends StatelessWidget {
  final bool showText;
  final double iconSize;
  final double textSize;
  const SocialMediaView({super.key, required this.showText, required this.iconSize, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(80),
              topRight: Radius.circular(70),
              bottomRight: Radius.circular(90),
            ),
          ),
          child: Image.asset("assets/images/avatar.png", width: 50, height: 50),
        ),

        SizedBox(width: 15),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(Constants.socialMediaContentModel.length, (
            index,
          ) {
            return SocialMediaContent(
              socialMediaContent: Constants.socialMediaContentModel[index],
              showText: showText,
              textSize: textSize,
              iconSize: iconSize,
            );
          }),
        ),
      ],
    );
  }
}
