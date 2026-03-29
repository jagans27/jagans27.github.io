import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/controllers/root_controller.dart';
import 'package:portfolio/routes/pages.dart';
import 'package:portfolio/screens/home/widgets/line_menu_item.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

class LineMenu extends StatefulWidget {
  final List<String> listOfMenu;
  const LineMenu({super.key, required this.listOfMenu});

  @override
  State<LineMenu> createState() => _MenuListState();
}

class _MenuListState extends State<LineMenu> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<RootController>(
      builder: (context, rootController, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.listOfMenu.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = null),
                cursor: SystemMouseCursors.click,
                child: LineMenuItem(
                  index: index,
                  title: widget.listOfMenu[index],
                  isSelected:
                      (hoveredIndex) == index ||
                      (rootController.currentIndex) == index,
                  onTap: () {
                    if (index == Constants.resumeMenuIndex) {
                      Utils.launchURL(url: Constants.resumeLink);
                    } else {
                      rootController.setCurrentIndex(index);

                      final tab = (index == 0)
                          ? 'work'
                          : (index == 1)
                          ? 'project'
                          : null;

                      if (tab != null) {
                        context.go(
                          '/home?tab=$tab',
                        ); // updates URL and triggers rebuild
                      } else {
                        context.go('/home'); // fallback to default
                      }
                    }
                  },
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
