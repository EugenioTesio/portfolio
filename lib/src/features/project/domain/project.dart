class Project {
  const Project({
    required this.title,
    required this.description,
    required this.url,
    required this.asset,
    this.technologies,
  });
  final String title;
  final String description;
  final String url;
  final String asset;
  final List<String>? technologies;
}
