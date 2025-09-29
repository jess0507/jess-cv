import 'package:flutter/material.dart';
import 'package:resume/core/widgets/spaces.dart';

import '../../data/constants.dart';
import 'portfolio_item.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});
  static const path = '/portfolio';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceH60(),
          ...portfolioList
              .map((portfolio) => PortfolioItem(portfolio: portfolio)),
        ],
      ),
    );
  }
}
