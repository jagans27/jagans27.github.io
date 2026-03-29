import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/screens/home/widgets/work_menu_view.dart';

class ExperienceTabView extends StatefulWidget {
  final ScrollController scrollController;
  const ExperienceTabView({super.key, required this.scrollController});

  @override
  State<ExperienceTabView> createState() => _ExperienceTabViewState();
}

class _ExperienceTabViewState extends State<ExperienceTabView> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75),
              WorkMenuView(projectTitle: "Experience", works: Constants.works),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
