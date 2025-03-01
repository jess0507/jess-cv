import 'package:flutter/material.dart';
import 'package:resume/data/data.dart';
import 'package:resume/utils/functions.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/nav_item.dart';
import 'package:resume/widgets/nimbus_vertical_divider.dart';
import 'package:resume/widgets/social_button.dart';
import 'package:resume/widgets/spaces.dart';

const double logoSpaceLeftLg = 40.0;
const double logoSpaceLeftSm = 20.0;
const double logoSpaceRightLg = 70.0;
const double logoSpaceRightSm = 35.0;
const double contactButtonSpaceLeftLg = 60.0;
const double contactButtonSpaceLeftSm = 30.0;
const double contactButtonSpaceRightLg = 40.0;
const double contactButtonSpaceRightSm = 20.0;
const double contactBtnWidthLg = 150.0;
const double contactBtnWidthSm = 120.0;
const int menuSpacerRightLg = 5;
const int menuSpacerRightMd = 4;
const int menuSpacerRightSm = 3;

class NavSectionWeb extends StatefulWidget {
  final List<NavItemData> navItems;

  const NavSectionWeb({required this.navItems});

  @override
  _NavSectionWebState createState() => _NavSectionWebState();
}

class _NavSectionWebState extends State<NavSectionWeb> {
  @override
  Widget build(BuildContext context) {
    double logoSpaceLeft = 40.0;
    double logoSpaceRight = 35.0;
    double contactBtnSpaceRight = 40.0;
    int menuSpacerRight = 3;
    final textTheme = Theme.of(context).textTheme;

    List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
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

    _onTapNavItem({
      required GlobalKey context,
      required String navItemName,
    }) {
      for (int index = 0; index < widget.navItems.length; index++) {
        if (navItemName == widget.navItems[index].name) {
          scrollToSection(context.currentContext!);
          setState(() {
            widget.navItems[index].isSelected = true;
          });
        } else {
          widget.navItems[index].isSelected = false;
        }
      }
    }

    List<Widget> _buildNavItems(List<NavItemData> navItems) {
      List<Widget> items = [];
      for (int index = 0; index < navItems.length; index++) {
        items.add(
          NavItem(
            title: navItems[index].name,
            isSelected: navItems[index].isSelected,
            onTap: () => _onTapNavItem(
              context: navItems[index].key,
              navItemName: navItems[index].name,
            ),
          ),
        );
        items.add(Spacer());
      }
      return items;
    }

    return Container(
      height: Sizes.HEIGHT_100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          Shadows.elevationShadow,
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(width: logoSpaceLeft),
            InkWell(
              onTap: () {},
              child: Text(
                StringConst.LOGO,
                style: textTheme.headlineMedium,
              ),
            ),
            SizedBox(width: logoSpaceRight),
            NimbusVerticalDivider(),
            Spacer(flex: 1),
            ..._buildNavItems(widget.navItems),
            Spacer(flex: menuSpacerRight),
            Row(
              children: [
                ..._buildSocialIcons(socialData),
                SpaceW20(),
              ],
            ),
            SizedBox(width: contactBtnSpaceRight),
          ],
        ),
      ),
    );
  }
}
