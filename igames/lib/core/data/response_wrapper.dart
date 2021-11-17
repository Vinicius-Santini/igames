class TheGameDBWrapper<T> {
  final String? nextPage;
  final String? previousPage;
  final int? resultsCount;
  final List<dynamic> results;

  TheGameDBWrapper({
    required this.nextPage,
    required this.previousPage,
    required this.resultsCount,
    required this.results,
  });

  static TheGameDBWrapper fromJson(Map<String, dynamic> json) =>
      TheGameDBWrapper(
        nextPage: json["next"] as String?,
        previousPage: json["previous"] as String?,
        resultsCount: json["count"] as int?,
        results: json["results"] as List<dynamic>,
      );
}
