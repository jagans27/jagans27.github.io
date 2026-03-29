import 'package:flutter/material.dart';
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/screens/home/widgets/anchor_content.dart';
import 'package:portfolio/screens/home/widgets/project_popup.dart';
import 'package:portfolio/styles/app_assets.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';
import 'package:portfolio/utils/utils.dart';

class ContentCard extends StatefulWidget {
  final double width;
  final double height;
  final ProjectModel project;
  final bool isDimming;
  final bool isHovered;

  const ContentCard({
    super.key,
    required this.width,
    required this.height,
    required this.project,
    required this.isDimming,
    this.isHovered = false,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            barrierDismissible: false,
            barrierColor: AppColors.black.withValues(alpha: 0.3),
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProjectPopup(project: widget.project),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position:
                        Tween<Offset>(
                          begin:
                              (Breakpoints.mobile.isBreakpoint(context) ||
                                  Breakpoints.tablet.isBreakpoint(context))
                              ? const Offset(0, 1)
                              : const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                    child: child,
                  );
                },
          ),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: widget.width,
          height: widget.isHovered ? null : widget.height,
          color: widget.isDimming
              ? AppColors.cardBackgroundDimmed
              : AppColors.cardBackground,
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                widget.project.name,
                style: AppTextStyles.cardTitle.merge(
                  TextStyle(
                    color: AppColors.white.withValues(
                      alpha: widget.isDimming ? 0.5 : 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2),
              SelectableText(
                widget.project.technologies.join(", ").toUpperCase(),
                style: AppTextStyles.cardTechnology.merge(
                  TextStyle(
                    color: AppColors.blackPale.withValues(
                      alpha: widget.isDimming ? 0.5 : 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              Expanded(
                child: Text(
                  widget.project.description.first.text,
                  softWrap: true,
                  maxLines: 3, 
                  overflow: TextOverflow.ellipsis, // clip at the bottom edge
                  style: AppTextStyles.cardSubtitle.merge(
                    TextStyle(
                      color: AppColors.paragraph.withValues(
                        alpha: widget.isDimming ? 0.5 : 1,
                      ),
                    ),
                  ),
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      isDimming: widget.isDimming,
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
                      isDimming: widget.isDimming,
                    ),
                  if (widget.project.playStoreLink != null)
                    const SizedBox(width: 15),

                  if (widget.project.appStoreLink != null)
                    AnchorContent(
                      onTap: () {
                        Utils.launchURL(url: widget.project.appStoreLink ?? "");
                      },
                      title: "App Store",
                      iconPath: AppAssets.appstoreIcon,
                      isDimming: widget.isDimming,
                    ),
                  if (widget.project.appStoreLink != null)
                    const SizedBox(width: 15),

                  if (widget.project.websiteLink != null)
                    AnchorContent(
                      onTap: () {
                        Utils.launchURL(url: widget.project.websiteLink ?? "");
                      },
                      title: "Website",
                      iconPath: AppAssets.websiteIcon,
                      isDimming: widget.isDimming,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
