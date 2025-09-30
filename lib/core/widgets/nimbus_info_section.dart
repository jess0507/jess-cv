import 'package:flutter/material.dart';

import '../values/values.dart';
import 'spaces.dart';

class NimbusInfoSection extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final int quarterTurns;
  final double dividerHeight;
  final Widget? child;

  const NimbusInfoSection({
    super.key,
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.grey350,
    this.dividerHeight = 40,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headlineMedium?.copyWith(
      fontSize: 26,
    );
    double fontSize = 16;
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RotatedBox(
              quarterTurns: quarterTurns,
              child: Text(
                sectionTitle,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey250,
                ),
              ),
            ),
            SpaceH16(),
            SizedBox(
              height: dividerHeight,
              child: VerticalDivider(
                color: dividerColor,
                thickness: thickness,
              ),
            ),
          ],
        ),
        SpaceW16(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: title1Style ?? titleStyle,
              ),
              if (hasTitle2) SizedBox(height: 16),
              if (hasTitle2)
                Text(
                  title2,
                  style: title2Style ?? titleStyle,
                ),
              SpaceH20(),
              Text(
                body,
                style: textTheme.bodySmall
                    ?.copyWith(fontSize: fontSize, height: 1.8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
