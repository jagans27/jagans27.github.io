import 'package:flutter/material.dart';
import 'package:portfolio/styles/app_colors.dart';

class LazyCursorOverlay extends StatefulWidget {
  final Widget child;

  const LazyCursorOverlay({super.key, required this.child});

  @override
  State<LazyCursorOverlay> createState() => _LazyCursorOverlayState();
}

class _LazyCursorOverlayState extends State<LazyCursorOverlay> {
  Offset _targetPosition = Offset.zero;
  Offset _circlePosition = Offset.zero;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _targetPosition = event.position;
          _visible = true;
        });
      },
      onExit: (_) {
        setState(() {
          _visible = false;
        });
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          widget.child,

          TweenAnimationBuilder<Offset>(
            tween: Tween(begin: _circlePosition, end: _targetPosition),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              _circlePosition = value;
              return Positioned(
                left: value.dx - 3,
                top: value.dy - 5,
                child: IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
