import 'package:flutter/material.dart';
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/screens/home/widgets/anchor_content.dart';
import 'package:portfolio/screens/home/widgets/multi_highlight_text.dart';
import 'package:portfolio/screens/home/widgets/shine_text.dart';
import 'package:portfolio/styles/app_assets.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:portfolio/utils/utils.dart';

class ProjectPopup extends StatefulWidget {
  final ProjectModel project;

  const ProjectPopup({super.key, required this.project});

  @override
  State<ProjectPopup> createState() => _ProjectPopupState();
}

class _ProjectPopupState extends State<ProjectPopup> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
            ),
          ),
          Align(
            alignment:
                (Breakpoints.mobile.isBreakpoint(context) ||
                    Breakpoints.tablet.isBreakpoint(context))
                ? AlignmentGeometry.center
                : AlignmentGeometry.bottomRight,
            child: GestureDetector(
              child: Container(
                margin:
                    (Breakpoints.mobile.isBreakpoint(context) ||
                        Breakpoints.tablet.isBreakpoint(context))
                    ? EdgeInsets.only(top: 25)
                    : EdgeInsets.zero,
                width:
                    (Breakpoints.mobile.isBreakpoint(context) ||
                        Breakpoints.tablet.isBreakpoint(context))
                    ? MediaQuery.of(context).size.width * 0.95
                    : MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(
                  (Breakpoints.mobile.isBreakpoint(context) ||
                          Breakpoints.tablet.isBreakpoint(context))
                      ? 10
                      : 24,
                ),
                decoration: BoxDecoration(color: AppColors.cardBackground),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (_) => setState(() => isHovered = true),
                        onExit: (_) => setState(() => isHovered = false),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close_sharp,
                            color: isHovered
                                ? Colors.white.withValues(alpha: 0.8)
                                : AppColors.paragraph,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height:
                          (Breakpoints.mobile.isBreakpoint(context) ||
                              Breakpoints.tablet.isBreakpoint(context))
                          ? 15
                          : 40,
                    ),

                    ShineText(text: widget.project.name),

                    const SizedBox(height: 10),
                    SelectableText(
                      widget.project.technologies.join(", ").toUpperCase(),
                      style: AppTextStyles.cardTechnology.merge(
                        TextStyle(color: AppColors.blackPale.withValues()),
                      ),
                    ),
                    SizedBox(height: (Breakpoints.mobile.isBreakpoint(context) ||
                        Breakpoints.tablet.isBreakpoint(context)) ? 15 : 40),
                    Expanded(
                      child: Theme(
                        data: ThemeData(
                          scrollbarTheme: ScrollbarThemeData(
                            trackVisibility: WidgetStatePropertyAll(true),
                            thumbVisibility: WidgetStatePropertyAll(true),
                            thickness: WidgetStatePropertyAll(3.5),
                            radius: const Radius.circular(1),
                            interactive: true,
                            mainAxisMargin: 2,
                            thumbColor: WidgetStatePropertyAll(
                              AppColors.blackPale,
                            ),
                            trackColor: WidgetStatePropertyAll(
                              AppColors.blackPale.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                widget.project.description.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          margin: EdgeInsets.only(
                                            left: 20,
                                            right: 30,
                                            top: 13,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.blackPale,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8.0,
                                            ),
                                            child: MultiHighlightText(
                                              text: widget
                                                  .project
                                                  .description[index]
                                                  .text,
                                              defaultStyle: AppTextStyles
                                                  .paragraph
                                                  .merge(
                                                    TextStyle(
                                                      color:
                                                          AppColors.paragraph,
                                                    ),
                                                  ),
                                              highlights: {
                                                for (var highlight
                                                    in widget
                                                        .project
                                                        .description[index]
                                                        .highlights)
                                                  highlight: AppTextStyles
                                                      .paragraph
                                                      .merge(
                                                        TextStyle(
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.project.repositoryLink != null)
                          AnchorContent(
                            onTap: () {
                              Utils.launchURL(
                                url: widget.project.repositoryLink ?? "",
                              );
                            },
                            title: "Code",
                            iconPath: AppAssets.codeBranchIcon,
                            isDimming: false,
                            iconSize: 18,
                            touchAreaSize: 24,
                          ),
                        if (widget.project.repositoryLink != null)
                          const SizedBox(width: 15),

                        if (widget.project.playStoreLink != null)
                          AnchorContent(
                            onTap: () {
                              Utils.launchURL(
                                url: widget.project.playStoreLink ?? "",
                              );
                            },
                            title: "Play Store",
                            iconPath: AppAssets.playstoreIcon,
                            isDimming: false,
                            iconSize: 18,
                            touchAreaSize: 24,
                          ),
                        if (widget.project.playStoreLink != null)
                          const SizedBox(width: 15),

                        if (widget.project.appStoreLink != null)
                          AnchorContent(
                            onTap: () {
                              Utils.launchURL(
                                url: widget.project.appStoreLink ?? "",
                              );
                            },
                            title: "App Store",
                            iconPath: AppAssets.appstoreIcon,
                            isDimming: false,
                            iconSize: 18,
                            touchAreaSize: 24,
                          ),
                        if (widget.project.appStoreLink != null)
                          const SizedBox(width: 15),

                        if (widget.project.websiteLink != null)
                          AnchorContent(
                            onTap: () {
                              Utils.launchURL(
                                url: widget.project.websiteLink ?? "",
                              );
                            },
                            title: "Website",
                            iconPath: AppAssets.websiteIcon,
                            isDimming: false,
                            iconSize: 18,
                            touchAreaSize: 24,
                          ),
                      ],
                    ),
                    SizedBox(
                      height:
                          (Breakpoints.mobile.isBreakpoint(context) ||
                              Breakpoints.tablet.isBreakpoint(context))
                          ? 5
                          : 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
