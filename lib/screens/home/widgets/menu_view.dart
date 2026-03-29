import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/screens/home/widgets/content_card.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';

class MenuView extends StatefulWidget {
  final String projectTitle;
  final List<ProjectModel> projects;
  const MenuView({
    super.key,
    required this.projects,
    required this.projectTitle,
  });

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    double spacing = 10;
    double cardHeight = 280;
    double cardWidth = MediaQuery.of(context).size.width / 4.5 - spacing * 1.5;
    double scaleAmount = 1.1;

    int totalRows = (widget.projects.length / 2).ceil();

    Widget buildCard(int index) {
      final project = widget.projects[index];
      int row = index ~/ 2;
      int col = index % 2;
      bool isHovered = _hoveredIndex == index;

      // Calculate the extra space needed for the scaled card
      double extraWidth = cardWidth * (scaleAmount - 1);
      double extraHeight = cardHeight * (scaleAmount - 1);

      return Positioned(
        top:
            row * (cardHeight + spacing) +
            (index.isOdd ? 25 : 0) -
            extraHeight / 2,
        left: col * (cardWidth + spacing) - extraWidth / 2,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              _hoveredIndex = index;
            });
          },
          onExit: (_) {
            setState(() {
              _hoveredIndex = -1;
            });
          },
          child: Container(
            width: cardWidth + extraWidth,
            height: isHovered
                ? cardHeight + extraHeight
                : cardHeight + extraHeight,
            alignment: Alignment.center,
            child: Transform.scale(
              scale: isHovered ? scaleAmount : 1.0,
              child: SizedBox(
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  child: ContentCard(
                    width: cardWidth,
                    height: cardHeight,
                    project: project,
                    isHovered: isHovered,
                    isDimming: !isHovered && _hoveredIndex != -1,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 100),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            widget.projectTitle.toUpperCase(),
            style: AppTextStyles.menuTitle.merge(
              TextStyle(color: AppColors.paragraph),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: cardWidth * 2 + spacing,
            height: totalRows * (cardHeight + spacing),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Render all cards in normal order
                for (int i = 0; i < widget.projects.length; i++)
                  if (_hoveredIndex != i) buildCard(i),
                // Always render hovered card last to ensure it's on top
                if (_hoveredIndex != -1) buildCard(_hoveredIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
