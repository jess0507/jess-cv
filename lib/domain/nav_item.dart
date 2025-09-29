class NavItemData {
  final String key;
  final bool isSelected;
  final String path;

  NavItemData({
    required this.key,
    this.isSelected = false,
    required this.path,
  });

  NavItemData copy({
    String? name,
    bool? isSelected,
    String? path,
  }) =>
      NavItemData(
          key: name ?? this.key,
          isSelected: isSelected ?? this.isSelected,
          path: path ?? this.path);
}
