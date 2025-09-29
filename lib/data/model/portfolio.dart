class Portfolio {
  final String project;
  final String description;
  final String company;
  final List<Feature> features;

  Portfolio({
    required this.project,
    this.description = '',
    this.company = '',
    this.features = const [],
  });
}

class Feature {
  final String title;
  final List<String> urls;
  final double aspectRatio;

  Feature({
    required this.title,
    this.urls = const [],
    this.aspectRatio = 9 / 16,
  });
}
