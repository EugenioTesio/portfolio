class Experience {
  const Experience({
    required this.startDate,
    required this.endDate,
    required this.job,
    required this.company,
    required this.description,
    this.technologies,
    this.url,
  });
  final String startDate;
  final String endDate;
  final String job;
  final String company;
  final String description;
  final List<String>? technologies;
  final String? url;
}
