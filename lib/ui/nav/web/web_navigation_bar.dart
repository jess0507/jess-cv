import 'package:flutter/material.dart';
import 'package:resume/data/constants.dart';
import 'package:resume/core/utils/functions.dart';
import 'package:resume/core/values/values.dart';
import 'package:resume/ui/nav/web/nav_item.dart';
import 'package:resume/ui/nav/web/nimbus_vertical_divider.dart';
import 'package:resume/core/widgets/social_button.dart';
import 'package:resume/core/widgets/spaces.dart';

import '../../../data/locale_service.dart';
import '../../../domain/nav_data.dart';
import '../../scaffold_with_nav.dart';

class WebNavigationBar extends StatefulWidget {
  final List<NavData> navItems;
  final OnTapNavItem onTapNavItem;

  const WebNavigationBar(
      {super.key, required this.navItems, required this.onTapNavItem});

  @override
  State<WebNavigationBar> createState() => _WebNavigationBarState();
}

class _WebNavigationBarState extends State<WebNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
      List<Widget> items = [];
      for (int index = 0; index < socialItems.length; index++) {
        items.add(
          SocialButton(
            tag: socialItems[index].tag,
            iconData: socialItems[index].iconData,
            onPressed: () => openUrlLink(socialItems[index].url),
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
            title: LocaleService().getText(navItems[index].key),
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
                LocaleService().getText("logo"),
                style: textTheme.headlineMedium,
              ),
            ),
            SizedBox(width: 35),
            NimbusVerticalDivider(),
            Spacer(),
            ...buildNavItems(widget.navItems),
            Spacer(flex: 3),
            Row(
              children: [
                ...buildSocialIcons(socialData),
                SpaceW20(),
              ],
            ),
            SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
