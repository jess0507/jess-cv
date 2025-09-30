import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/core/values/values.dart';
import 'package:resume/data/locale_service.dart';
import 'package:resume/ui/scaffold_with_nav.dart';
import 'package:resume/core/widgets/spaces.dart';

import '../../../core/utils/functions.dart';
import '../../../core/widgets/social_button.dart';
import '../../../data/constants.dart';
import '../../../domain/nav_data.dart';
import '../web/nav_item.dart';

class AppDrawer extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavData> navItems;
  final GestureTapCallback? onClose;
  final OnTapNavItem onTapNavItem;

  const AppDrawer({
    super.key,
    this.color = AppColors.black100,
    this.width,
    required this.navItems,
    this.onClose,
    required this.onTapNavItem,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        color: widget.color,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // InkWell(
                //   onTap: () {},
                //   child: Image.asset(
                //     ImagePath.LOGO_LIGHT,
                //     height: 52,
                //   ),
                // ),
                Spacer(),
                InkWell(
                  onTap: widget.onClose ?? () => _closeDrawer(),
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Spacer(flex: 2),
            ..._buildMenuList(
              textTheme: textTheme,
              menuList: widget.navItems,
            ),
            Spacer(flex: 6),
            _buildFooterText(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required TextTheme textTheme,
    required List<NavData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => widget.onTapNavItem(menuList[i]),
          title: LocaleService().getText(widget.navItems[i].key),
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleColor: AppColors.white,
          titleStyle: textTheme.bodyMedium?.copyWith(
            color:
                menuList[i].isSelected ? AppColors.primary200 : AppColors.white,
            fontSize: 16,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(Spacer());
    }
    return menuItems;
  }

  _closeDrawer() {
    Navigator.pop(context);
  }

  Widget _buildFooterText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodyMedium?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [...buildSocialIcons(socialData)],
        ),
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: LocaleService().getText("buildBy"),
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: LocaleService().getText("jessYen"),
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleService().getText("madeIn"), style: footerTextStyle),
            SpaceW4(),
            ClipRRect(
              borderRadius: BorderRadius.all(const Radius.circular(20)),
              child: Text('🇹🇼'),
            ),
            SpaceW4(),
            Text(LocaleService().getText("with"), style: footerTextStyle),
            SpaceW4(),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.red,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          buttonColor: widget.color,
          iconColor: Colors.white,
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () => openUrlLink(socialItems[index].url),
        ),
      );
      items.add(SpaceW16());
    }
    return items;
  }
}
