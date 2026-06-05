import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/core/utils/functions.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/social_button.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/data/models/social_item.dart';
import 'package:jessweb/data/providers/portfolio_provider.dart';
import 'package:jessweb/features/navigation/locale_selector.dart';
import 'package:jessweb/features/navigation/nav_data.dart';
import 'package:jessweb/features/navigation/scaffold_with_nav.dart';
import 'package:jessweb/features/navigation/web/nav_item.dart';
import 'package:jessweb/features/navigation/web/nimbus_vertical_divider.dart';

class WebNavigationBar extends ConsumerStatefulWidget {
  final List<NavData> navItems;
  final OnTapNavItem onTapNavItem;

  const WebNavigationBar({
    super.key,
    required this.navItems,
    required this.onTapNavItem,
  });

  @override
  ConsumerState<WebNavigationBar> createState() => _WebNavigationBarState();
}

class _WebNavigationBarState extends ConsumerState<WebNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tr = trWithContext(context);
    final socialData =
        ref.watch(portfolioProvider).valueOrNull?.socials ?? const [];

    List<Widget> buildSocialIcons(List<SocialItem> socialItems) {
      List<Widget> items = [];
      for (int index = 0; index < socialItems.length; index++) {
        items.add(
          SocialButton(
            tag: socialItems[index].tag,
            iconData: socialItems[index].iconData,
            onPressed: () {
              AnalyticsService().logEvent(
                name: 'social_link_click',
                parameters: {
                  'social_type': socialItems[index].tag,
                  'url': socialItems[index].url,
                  'source': 'web_navigation_bar',
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

    List<Widget> buildNavItems(List<NavData> navItems) {
      List<Widget> items = [];
      for (int index = 0; index < navItems.length; index++) {
        items.add(
          NavItem(
            title: tr.navLabel(navItems[index].key),
            isSelected: navItems[index].isSelected,
            onTap: () => widget.onTapNavItem(navItems[index]),
          ),
        );
      }
      return items;
    }

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          Shadows.elevationShadow,
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(width: 40),
            InkWell(
              onTap: () {},
              child: Text(
                tr.logo,
                style: textTheme.headlineMedium,
              ),
            ),
            SizedBox(width: 35),
            NimbusVerticalDivider(),
            SizedBox(width: 30),
            ...buildNavItems(widget.navItems),
            Spacer(),
            Row(
              children: [
                ...buildSocialIcons(socialData),
                SpaceW20(),
              ],
            ),
            const LocaleSelector(),
            SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
