import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/screens/home/widgets/menu_view.dart';

class ProjectTabView extends StatefulWidget {
  final ScrollController scrollController;
  const ProjectTabView({super.key, required this.scrollController});

  @override
  State<ProjectTabView> createState() => _ProjectTabViewState();
}

class _ProjectTabViewState extends State<ProjectTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuView(
                projectTitle: Constants.krishworksProjectString,
                projects: Constants.krishworksProjects,
              ),
              MenuView(
                projectTitle: Constants.avasoftProjectString,
                projects: Constants.avasoftProjects,
              ),
              MenuView(
                projectTitle: Constants.personalProjectString,
                projects: Constants.personalProjects,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
