import 'package:flutter/material.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/core/utils/functions.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/social_button.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/data/models/social_item.dart';

/// 社群圖示橫列,點擊時記錄分析事件並開啟連結。
///
/// 取代各頁面重複的 `buildSocialIcons`,透過 [source] 區分分析來源,
/// 並以樣式參數對應不同頁面的外觀。
class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({
    super.key,
    required this.socials,
    required this.source,
    this.buttonColor = AppColors.white,
    this.iconColor = AppColors.black,
    this.iconSize = 14,
    this.elevation = 1,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final List<SocialItem> socials;

  /// 分析事件的來源標記(如 `info_section`、`web_navigation_bar`)。
  final String source;
  final Color buttonColor;
  final Color iconColor;
  final double iconSize;
  final double elevation;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        for (final social in socials) ...[
          SocialButton(
            elevation: elevation,
            buttonColor: buttonColor,
            iconColor: iconColor,
            iconSize: iconSize,
            tag: social.tag,
            iconData: social.iconData,
            onPressed: () {
              AnalyticsService().logEvent(
                name: 'social_link_click',
                parameters: {
                  'social_type': social.tag,
                  'url': social.url,
                  'source': source,
                },
              );
              openUrlLink(social.url);
            },
          ),
          SpaceW16(),
        ],
      ],
    );
  }
}
