class WorkModel {
  final String name;
  final String designation;
  final String description;
  final String start;
  final String end;
  final String? url;

  WorkModel({
    required this.name,
    required this.designation,
    required this.description,
    required this.start,
    required this.end,
    this.url,
  });
}
