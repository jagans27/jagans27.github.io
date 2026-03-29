import 'package:flutter/material.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/screens/home/widgets/experience_content_card.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';

class WorkMenuView extends StatefulWidget {
  final String projectTitle;
  final List<WorkModel> works;
  const WorkMenuView({
    super.key,
    required this.works,
    required this.projectTitle,
  });

  @override
  State<WorkMenuView> createState() => _WorkMenuViewState();
}

class _WorkMenuViewState extends State<WorkMenuView> {
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    double spacing = 10;
    double cardHeight = 210;
    double cardWidth = MediaQuery.of(context).size.width * 0.45;
    double scaleAmount = 1.09;

    Widget buildCard(int index) {
      WorkModel work = widget.works[index];
      bool isHovered = _hoveredIndex == index;

      double extraWidth = cardWidth * (scaleAmount - 1);
      double extraHeight = cardHeight * (scaleAmount - 1);

      return Positioned(
        top: index * (cardHeight + spacing) - extraHeight / 2 + 33,
        left: 0,
        child: MouseRegion(
          onEnter: (_) {
            setState(() => _hoveredIndex = index);
          },
          onExit: (_) {
            setState(() => _hoveredIndex = -1);
          },
          child: Container(
            width: cardWidth + extraWidth,
            height: cardHeight + extraHeight,
            alignment: Alignment.centerLeft,
            child: Transform.scale(
              alignment: Alignment.center, // scale from top-left
              scale: isHovered ? scaleAmount : 1.0,
              child: Material(
                borderRadius: BorderRadius.circular(12),
                child: ExperienceContentCard(
                  width: cardWidth,
                  height: cardHeight,
                  work: work,
                  isDimming: !isHovered && _hoveredIndex != -1,
                ),
              ),
            ),
          ),
        ),
      );
    }

    double headerHeight = 40; // adjust if your text height changes
    double stackHeight =
        headerHeight +
        widget.works.length * (cardHeight + spacing) +
        cardHeight * (scaleAmount - 1);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 120, top: 20, bottom: 20),
      child: SizedBox(
        height: stackHeight,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topLeft,
          children: [
            // Header text
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                widget.projectTitle.toUpperCase(),
                style: AppTextStyles.menuTitle.merge(
                  TextStyle(color: AppColors.paragraph),
                ),
              ),
            ),
            // Cards
            for (int i = 0; i < widget.works.length; i++)
              if (_hoveredIndex != i) buildCard(i),
            if (_hoveredIndex != -1) buildCard(_hoveredIndex),
          ],
        ),
      ),
    );
  }
}
