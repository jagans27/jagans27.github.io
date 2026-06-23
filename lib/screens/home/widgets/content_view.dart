import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/screens/home/widgets/line_menu.dart';
import 'package:portfolio/screens/home/widgets/name_view.dart';
import 'package:portfolio/screens/home/widgets/social_media_view.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 85),
        child: SizedBox(
          height: screenHeight,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: screenHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 80.0, bottom: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: const NameView(name: Constants.welcomeText),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: LineMenu(listOfMenu: Constants.menuItems),
                      ),

                      const Expanded(flex: 1, child: SizedBox.shrink()),

                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: SocialMediaView(
                          showText: MediaQuery.of(context).size.width > 1480,
                          iconSize: MediaQuery.of(context).size.width > 1480
                              ? 15
                              : 20,
                          textSize: 12,
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox.shrink()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
