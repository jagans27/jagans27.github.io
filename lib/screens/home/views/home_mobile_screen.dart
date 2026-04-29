import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/screens/home/widgets/content_card.dart';
import 'package:portfolio/screens/home/widgets/experience_content_card.dart';
import 'package:portfolio/screens/home/widgets/footer.dart';
import 'package:portfolio/screens/home/widgets/name_view.dart';
import 'package:portfolio/screens/home/widgets/resume_preview_button.dart';
import 'package:portfolio/screens/home/widgets/social_media_view.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/styles/app_text_styles.dart';

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Top spacing
              SliverToBoxAdapter(child: SizedBox(height: 40)),

              // NameView
              SliverToBoxAdapter(child: Center(child: NameView(name: Constants.welcomeTextNewLine))),
              SliverToBoxAdapter(child: SizedBox(height: 40)),

              // Resume Button
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ResumePreviewButton(),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 40)),
              // SocialMediaView
              SliverToBoxAdapter(
                child: SocialMediaView(
                  showText: false,
                  iconSize: 15,
                  textSize: 13,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 40)),

              // Experience Sticky Header
              SliverStickyHeader(
                header: Container(
                  height: 60,
                  color: AppColors.background,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Experience".toUpperCase(),
                    style: AppTextStyles.menuTitle.merge(
                      TextStyle(color: AppColors.paragraph),
                    ),
                  ),
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ExperienceContentCard(
                        width: screenWidth,
                        height: 230,
                        work: Constants.works[index],
                        isDimming: false,
                      ),
                    );
                  }, childCount: Constants.works.length),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverStickyHeader(
                header: Container(
                  height: 60,
                  color: AppColors.background,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    Constants.krishworksProjectString.toUpperCase(),
                    style: AppTextStyles.menuTitle.merge(
                      TextStyle(color: AppColors.paragraph),
                    ),
                  ),
                ),
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(bottom: 10),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ContentCard(
                        project: Constants.krishworksProjects[index],
                        width: double.infinity,
                        height: 280, // fixed height
                        isDimming: false,
                      );
                    }, childCount: Constants.krishworksProjects.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // 2 cards per row
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 280, // FIXED height for all cards
                        ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverStickyHeader(
                header: Container(
                  height: 60,
                  color: AppColors.background,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    Constants.avasoftProjectString.toUpperCase(),
                    style: AppTextStyles.menuTitle.merge(
                      TextStyle(color: AppColors.paragraph),
                    ),
                  ),
                ),
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(bottom: 10),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ContentCard(
                        project: Constants.avasoftProjects[index],
                        width: double.infinity,
                        height: 280, // fixed height
                        isDimming: false,
                      );
                    }, childCount: Constants.avasoftProjects.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // 2 cards per row
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 280, // FIXED height for all cards
                        ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverStickyHeader(
                header: Container(
                  height: 60,
                  color: AppColors.background,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    Constants.personalProjectString.toUpperCase(),
                    style: AppTextStyles.menuTitle.merge(
                      TextStyle(color: AppColors.paragraph),
                    ),
                  ),
                ),
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(bottom: 10),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ContentCard(
                        project: Constants.personalProjects[index],
                        width: double.infinity,
                        height: 280, // fixed height
                        isDimming: false,
                      );
                    }, childCount: Constants.personalProjects.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // 2 cards per row
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 280, // FIXED height for all cards
                        ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverToBoxAdapter(child: Footer()),

              SliverToBoxAdapter(child: SizedBox(height: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
