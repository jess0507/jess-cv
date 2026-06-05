import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/widgets/social_icons_row.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/data/models/portfolio_data.dart';
import 'package:jessweb/data/providers/portfolio_provider.dart';
import 'package:jessweb/features/home/hello_text.dart';
import 'package:jessweb/features/home/info_action_buttons.dart';
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
              child: const HelloText(),
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
            InfoActionButtons(
              resumeLink: data.links.resumeGoogleDocs,
              portfolioLink: data.links.portfolioGoogleDocs,
            ),
            SpaceH28(),
            SocialIconsRow(
              socials: data.socials,
              source: 'info_section',
              elevation: 0,
              buttonColor: Colors.transparent,
              iconSize: 18.0,
            ),
          ],
        );
      },
    );
  }
}
