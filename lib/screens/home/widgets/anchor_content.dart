import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/styles/app_colors.dart';

class AnchorContent extends StatefulWidget {
  final String title;
  final String iconPath;
  final bool isDimming;
  final Function onTap;
  final double touchAreaSize;
  final double iconSize;
  const AnchorContent({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isDimming,
    required this.onTap,
    this.touchAreaSize = 20,
    this.iconSize = 14,
  });

  @override
  State<AnchorContent> createState() => _AnchorContentState();
}

class _AnchorContentState extends State<AnchorContent> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      behavior: HitTestBehavior.translucent,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: widget.touchAreaSize,
              width: widget.touchAreaSize,
              child: Center(
                child: SvgPicture.asset(
                  widget.iconPath,
                  width: widget.iconSize,
                  height: widget.iconSize,
                  colorFilter: ColorFilter.mode(
                    _isHovered
                        ? Colors.white.withValues(alpha: 0.8)
                        : (widget.isDimming
                              ? AppColors.paragraph.withValues(alpha: 0.5)
                              : AppColors.paragraph),
                    BlendMode.srcIn,
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
