import 'package:flutter/material.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/core/utils/functions.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/spaces.dart';

/// 首頁的履歷 / 作品集按鈕列。
class InfoActionButtons extends StatelessWidget {
  const InfoActionButtons({
    super.key,
    required this.resumeLink,
    required this.portfolioLink,
  });

  final String resumeLink;
  final String portfolioLink;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tr = trWithContext(context);
    return Row(
      children: [
        MaterialButton(
          minWidth: 80,
          height: 48,
          onPressed: () async {
            AnalyticsService().logEvent(
              name: 'button_clicked',
              parameters: {
                'button_name': 'resume',
                'link': resumeLink,
              },
            );
            await openUrlLink(resumeLink);
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(tr.resume,
                style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.accentColor, fontSize: 16)),
          ),
        ),
        SpaceW24(),
        MaterialButton(
          minWidth: 80,
          height: 48,
          onPressed: () async {
            AnalyticsService().logEvent(
              name: 'button_clicked',
              parameters: {
                'button_name': 'portfolio',
                'link': portfolioLink,
              },
            );
            await openUrlLink(portfolioLink);
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          color: AppColors.black200,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(tr.portfolio,
                style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.accentColor, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
