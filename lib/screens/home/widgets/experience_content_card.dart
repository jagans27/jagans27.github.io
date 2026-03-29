import 'package:flutter/material.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:portfolio/utils/utils.dart';

class ExperienceContentCard extends StatefulWidget {
  final double width;
  final double height;
  final WorkModel work;
  final bool isDimming;

  const ExperienceContentCard({
    super.key,
    required this.width,
    required this.height,
    required this.work,
    required this.isDimming,
  });

  @override
  State<ExperienceContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ExperienceContentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.isDimming
          ? AppColors.cardBackgroundDimmed
          : AppColors.cardBackground,
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            cursor: widget.work.url != null
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: InkWell(
              onTap: widget.work.url == null
                  ? null
                  : () => Utils.launchURL(url: widget.work.url ?? ""),
              child: Text(
                widget.work.name,
                style: AppTextStyles.cardExperienceTitle.merge(
                  TextStyle(
                    color: AppColors.white.withValues(
                      alpha: widget.isDimming ? 0.5 : 1,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 2),
          SelectableText(
            widget.work.designation,
            style: AppTextStyles.cardTechnology.merge(
              TextStyle(
                color: AppColors.blackPale.withValues(
                  alpha: widget.isDimming ? 0.5 : 1,
                ),
              ),
            ),
          ),
          Spacer(),
          SelectableText(
            widget.work.description,
            style: AppTextStyles.cardSubtitle.merge(
              TextStyle(
                color: AppColors.paragraph.withValues(
                  alpha: widget.isDimming ? 0.5 : 1,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SelectableText(
                widget.work.start,
                style: AppTextStyles.cardSubtitle.merge(
                  TextStyle(
                    color: AppColors.paragraph.withValues(
                      alpha: widget.isDimming ? 0.5 : 1,
                    ),
                  ),
                ),
              ),
              SelectableText(
                " - ",
                style: AppTextStyles.cardSubtitle.merge(
                  TextStyle(
                    color: AppColors.paragraph.withValues(
                      alpha: widget.isDimming ? 0.5 : 1,
                    ),
                  ),
                ),
              ),
              SelectableText(
                widget.work.end,
                style: AppTextStyles.cardSubtitle.merge(
                  TextStyle(
                    color: AppColors.paragraph.withValues(
                      alpha: widget.isDimming ? 0.5 : 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
