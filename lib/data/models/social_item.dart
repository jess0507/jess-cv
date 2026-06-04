import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 社群連結資料與設定(data 層唯一來源)。
///
/// - JSON 內 [icon] 以字串 key 儲存,透過 [iconData] 對應到 FontAwesome 圖示,
///   避免在 JSON 中直接序列化 [IconData]。
/// - [iconColor] / [borderColor] 為選填樣式設定,JSON 以 hex 字串(如 `#FF0000`)儲存。
class SocialItem {
  final String tag;
  final String icon;
  final String url;
  final Color? iconColor;
  final Color? borderColor;

  SocialItem({
    required this.tag,
    required this.icon,
    required this.url,
    this.iconColor,
    this.borderColor,
  });

  factory SocialItem.fromJson(Map<String, dynamic> json) {
    return SocialItem(
      tag: json['tag'] as String,
      icon: json['icon'] as String,
      url: json['url'] as String,
      iconColor: _colorFromHex(json['iconColor'] as String?),
      borderColor: _colorFromHex(json['borderColor'] as String?),
    );
  }

  Map<String, dynamic> toJson() => {
        'tag': tag,
        'icon': icon,
        'url': url,
        if (iconColor != null) 'iconColor': _colorToHex(iconColor!),
        if (borderColor != null) 'borderColor': _colorToHex(borderColor!),
      };

  /// 將 [icon] 字串 key 對應到實際的 FontAwesome 圖示。
  IconData get iconData => _iconMap[icon] ?? FontAwesomeIcons.link;

  static const Map<String, IconData> _iconMap = {
    'envelope': FontAwesomeIcons.envelope,
    'linkedin': FontAwesomeIcons.linkedin,
    'github': FontAwesomeIcons.github,
  };

  static Color? _colorFromHex(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    final value = hex.replaceFirst('#', '');
    final withAlpha = value.length == 6 ? 'FF$value' : value;
    return Color(int.parse(withAlpha, radix: 16));
  }

  static String _colorToHex(Color color) =>
      '#${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
}
