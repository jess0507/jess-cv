import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/utils/functions.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/spaces.dart';

import 'nav_item.dart';

const kSpacing20 = Sizes.SIZE_20;

class AppDrawer extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  final GestureTapCallback? onClose;

  const AppDrawer({
    super.key,
    this.color = AppColors.black100,
    this.width,
    required this.menuList,
    this.onClose,
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
          horizontal: Sizes.PADDING_24,
          vertical: Sizes.PADDING_24,
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
                //     height: Sizes.HEIGHT_52,
                //   ),
                // ),
                Spacer(),
                InkWell(
                  onTap: widget.onClose ?? () => _closeDrawer(),
                  child: Icon(
                    Icons.close,
                    size: Sizes.ICON_SIZE_30,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Spacer(flex: 2),
            ..._buildMenuList(
              textTheme: textTheme,
              menuList: widget.menuList,
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
    required List<NavItemData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleColor: AppColors.white,
          titleStyle: textTheme.bodyMedium?.copyWith(
            color:
                menuList[i].isSelected ? AppColors.primary200 : AppColors.white,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        _closeDrawer();
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "${StringConst.BUILT_BY} ",
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: "${StringConst.JESS_YEN}. ",
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
            Text(StringConst.MADE_IN_TAIWAN, style: footerTextStyle),
            SpaceW4(),
            ClipRRect(
              borderRadius: BorderRadius.all(const Radius.circular(20)),
              child: Text('🇹🇼'),
            ),
            SpaceW4(),
            Text(StringConst.WITH_LOVE, style: footerTextStyle),
            SpaceW4(),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.red,
              size: Sizes.ICON_SIZE_12,
            ),
          ],
        ),
      ],
    );
  }
}
