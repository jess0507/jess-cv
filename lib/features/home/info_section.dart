import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/core/utils/functions.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/social_button.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/data/models/portfolio_data.dart';
import 'package:jessweb/data/models/social_item.dart';
import 'package:jessweb/data/providers/portfolio_provider.dart';
import 'package:jessweb/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InfoSection extends ConsumerWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final tr = trWithContext(context);
    final data =
        ref.watch(portfolioProvider).valueOrNull ?? PortfolioData.empty();

    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        final isMobile = screenWidth < RefinedBreakpoints().tabletLarge;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: isMobile ? 180 : 160,
              child: buildHelloText(textTheme, tr),
            ),
            SpaceH30(),
            SelectableText(
              tr.aboutDev,
              style: textTheme.bodyMedium?.copyWith(fontSize: 16, height: 2),
            ),
            SpaceH36(),
            SelectableText(
              tr.emailLabel,
              style: textTheme.headlineMedium?.copyWith(
                fontSize: 16,
              ),
            ),
            SelectableText(
              tr.email,
              style: textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
            SpaceH36(),
            Row(
              children: [
                MaterialButton(
                  minWidth: 80,
                  height: 48,
                  onPressed: () async {
                    AnalyticsService().logEvent(
                      name: 'button_clicked',
                      parameters: {
                        'button_name': 'resume',
                        'link': data.links.resumeGoogleDocs,
                      },
                    );
                    await openUrlLink(data.links.resumeGoogleDocs);
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
                        'link': data.links.portfolioGoogleDocs,
                      },
                    );
                    await openUrlLink(data.links.portfolioGoogleDocs);
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
            ),
            SpaceH28(),
            Row(
              children: [...buildSocialIcons(data.socials)],
            )
          ],
        );
      },
    );
  }

  List<Widget> buildSocialIcons(List<SocialItem> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          elevation: 0,
          buttonColor: Colors.transparent,
          iconSize: 18.0,
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () {
            AnalyticsService().logEvent(
              name: 'social_link_click',
              parameters: {
                'social_type': socialItems[index].tag,
                'url': socialItems[index].url,
                'source': 'info_section',
              },
            );
            openUrlLink(socialItems[index].url);
          },
        ),
      );
      items.add(SpaceW16());
    }
    return items;
  }

  Widget buildHelloText(TextTheme textTheme, AppLocalizations tr) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(tr.intro,
                speed: Duration(milliseconds: 60),
                textStyle: textTheme.headlineMedium),
          ],
          onTap: () {},
          isRepeatingAnimation: true,
          totalRepeatCount: 5,
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              tr.position,
              speed: Duration(milliseconds: 80),
              textStyle: textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryColor,
                height: 1.2,
              ),
            ),
          ],
          onTap: () {},
          isRepeatingAnimation: true,
          totalRepeatCount: 5,
        ),
      ],
    );
  }
}
