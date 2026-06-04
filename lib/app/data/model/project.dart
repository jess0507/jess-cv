class Project {
  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String link;

  Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.link,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      link: json['link'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'imageUrl': imageUrl,
        'link': link,
      };
}
