import 'package:flutter/material.dart';
import 'package:resume/data/data.dart';
import 'package:resume/data/model/portfolio.dart';
import 'package:resume/utils/adaptive.dart';
import 'package:resume/utils/functions.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/spaces.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            '・',
            style: textTheme.headlineMedium?.copyWith(
                fontSize: Sizes.TEXT_SIZE_18, color: AppColors.black400),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                portfolio.project,
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
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- ',
                        style: textTheme.titleSmall?.copyWith(
                          color: AppColors.grey500,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feature.title,
                            style: textTheme.titleSmall?.copyWith(
                              color: AppColors.grey500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: feature.urls.map((url) {
                              final fixedWidth =
                                  (MediaQuery.of(context).size.width * 0.7 -
                                          32) /
                                      3;
                              final fixedHeight = fixedWidth * 1.5;

                              return InkWell(
                                onTap: () {
                                  openUrlLink(url);
                                },
                                child: Image.network(
                                  url,
                                  width: fixedWidth,
                                  height: fixedHeight,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
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
                          ),
                          SpaceH8(),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
