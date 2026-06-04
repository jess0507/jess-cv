class SkillData {
  final String category;
  final List<String> list;

  SkillData({
    required this.category,
    required this.list,
  });

  factory SkillData.fromJson(Map<String, dynamic> json) {
    return SkillData(
      category: json['category'] as String,
      list: (json['list'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
        'category': category,
        'list': list,
      };
}
