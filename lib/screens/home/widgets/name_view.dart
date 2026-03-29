import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/widgets/description_view.dart';
import 'package:portfolio/styles/app_text_styles.dart';

class NameView extends StatelessWidget {
  final String name;
  const NameView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: AppTextStyles.heading1),
        SizedBox(height: 10),
        DescriptionView(),
      ],
    );
  }
}
