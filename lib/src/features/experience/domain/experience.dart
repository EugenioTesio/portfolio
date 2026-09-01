class Experience {
  const Experience({
    required this.startDate,
    required this.endDate,
    required this.job,
    required this.company,
    required this.description,
    this.companyContext,
    this.technologies,
    this.url,
  });
  final String startDate;
  final String endDate;
  final String job;
  final String company;
  final String? companyContext;
  final String description;
  final List<String>? technologies;
  final String? url;
}
