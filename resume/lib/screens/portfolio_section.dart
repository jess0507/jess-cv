import 'package:flutter/material.dart';
import 'package:resume/data/data.dart';
import 'package:resume/data/model/portfolio.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/portfolio_images.dart';
import 'package:resume/widgets/spaces.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...portfolioList
            .map((portfolio) => PortfolioItem(portfolio: portfolio)),
      ],
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final Portfolio portfolio;
  const PortfolioItem({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          '・${portfolio.project}',
          style: textTheme.headlineMedium?.copyWith(
              fontSize: Sizes.TEXT_SIZE_18, color: AppColors.black400),
        ),
        SpaceH16(),
        if (portfolio.company.isNotEmpty) ...[
          Text(
            '(${portfolio.company})',
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.grey500,
            ),
          ),
        ],
        if (portfolio.description.isNotEmpty) ...[
          SpaceH8(),
          Text(
            portfolio.description,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.grey500,
            ),
          ),
        ],
        SpaceH16(),
        ...portfolio.features.map(
          (feature) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.title,
                  style: textTheme.titleSmall?.copyWith(
                    color: AppColors.grey500,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                PortfolioImages(
                  urls: feature.urls,
                  aspectRatio: feature.aspectRatio,
                ),
                SpaceH16(),
              ],
            );
          },
        ),
      ],
    );
  }
}
