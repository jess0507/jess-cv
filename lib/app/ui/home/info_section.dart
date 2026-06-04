import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/app/core/utils/l10n_helper.dart';
import 'package:resume/app/core/widgets/spaces.dart';
import 'package:resume/app/data/analytics_service.dart';
import 'package:resume/app/data/constants.dart';
import 'package:resume/l10n/app_localizations.dart';

import '../../core/utils/functions.dart';
import '../../core/values/values.dart';
import '../../core/widgets/social_button.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tr = trWithContext(context);

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
                        'link': resumeGoogleGocsLink,
                      },
                    );
                    await openUrlLink(resumeGoogleGocsLink);
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
                        'link': portfolioGoogleGocsLink,
                      },
                    );
                    await openUrlLink(portfolioGoogleGocsLink);
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
              children: [...buildSocialIcons(socialData)],
            )
          ],
        );
      },
    );
  }

  List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
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
