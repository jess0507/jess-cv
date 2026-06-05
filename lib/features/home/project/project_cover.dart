import 'package:flutter/material.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/features/navigation/web/animated_indicator.dart';

/// 專案卡片底部 hover 時浮現的標題列。
class ProjectCover extends StatelessWidget {
  const ProjectCover({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.animation,
    this.indicatorColor = AppColors.white,
    this.color,
    this.subtitleStyle,
    this.titleStyle,
    this.isHover = false,
  });

  final String title;
  final String subtitle;
  final double width;
  final double height;
  final Color? color;
  final Color indicatorColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Animation<double> animation;

  final bool isHover;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: width,
      height: height,
      color: color ?? Colors.black.withOpacity(0.8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedHoverIndicator2(
            animation: animation,
            indicatorColor: indicatorColor,
          ),
          SpaceW16(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle ??
                    textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                    ),
              ),
              SpaceH8(),
              Text(
                subtitle,
                style: subtitleStyle ??
                    textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
