import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resume/utils/adaptive.dart';
import 'package:resume/utils/functions.dart';
import 'package:resume/values/values.dart';

class PortfolioImages extends StatelessWidget {
  final List<String> urls;
  final double aspectRatio;
  final double fixedHeight;

  const PortfolioImages({
    super.key,
    this.urls = const [],
    this.aspectRatio = 1.0,
    this.fixedHeight = 400.0,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: assignHeight(context, 0.05),
      children: urls.map((url) {
        final fixedWidth = fixedHeight * aspectRatio;

        return InkWell(
          onTap: () {
            openUrlLink(url);
          },
          child: Image.network(
            url,
            height: fixedHeight,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              if (kDebugMode) {
                return Container(
                  width: fixedWidth,
                  height: fixedHeight,
                  color: AppColors.yellow10,
                  child: Icon(Icons.error),
                );
              }
              return Container(
                width: 100,
                height: 100,
                color: AppColors.yellow10,
                child: Icon(Icons.error),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
