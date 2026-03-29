class SocialMediaContentModel {
  final String url;
  final String title;
  final String iconPath;
  final String? subject;
  final String? body;
  SocialMediaContentModel({
    required this.url,
    required this.title,
    required this.iconPath,
    this.subject,
    this.body,
  });
}
