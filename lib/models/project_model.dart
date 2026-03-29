class ProjectModel {
  final String name;
  final String? logo;
  final List<Description> description;
  final List<String> technologies;
  final String? appStoreLink;
  final String? playStoreLink;
  final String? repositoryLink;
  final String? websiteLink;

  ProjectModel({
    this.logo,
    required this.name,
    required this.description,
    required this.technologies,
    this.appStoreLink,
    this.playStoreLink,
    this.repositoryLink,
    this.websiteLink,
  });
}

class Description {
  final String text;
  final List<String> highlights;
  Description({required this.text, required this.highlights});
}
