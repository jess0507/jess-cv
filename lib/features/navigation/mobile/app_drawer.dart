import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/utils/functions.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/social_button.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/data/models/social_item.dart';
import 'package:jessweb/data/providers/resume_provider.dart';
import 'package:jessweb/features/navigation/nav_data.dart';
import 'package:jessweb/features/navigation/locale_selector.dart';
import 'package:jessweb/features/navigation/web/nav_item.dart';
import 'package:jessweb/features/navigation/scaffold_with_nav.dart';

class AppDrawer extends ConsumerStatefulWidget {
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
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
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
            Align(
              alignment: Alignment.centerLeft,
              child: LocaleSelector(color: AppColors.white),
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
    final tr = trWithContext(context);
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => widget.onTapNavItem(menuList[i]),
          title: tr.navLabel(widget.navItems[i].key),
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
    final tr = trWithContext(context);
    final socialData = ref.watch(resumeDataProvider).socials;
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
        SpaceH12(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: tr.buildBy,
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: tr.jessYen,
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
            Text(tr.madeIn, style: footerTextStyle),
            SpaceW4(),
            ClipRRect(
              borderRadius: BorderRadius.all(const Radius.circular(20)),
              child: Text('🇹🇼'),
            ),
            SpaceW4(),
            Text(tr.withText, style: footerTextStyle),
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

  List<Widget> buildSocialIcons(List<SocialItem> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          buttonColor: widget.color,
          iconColor: Colors.white,
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () {
            AnalyticsService().logEvent(
              name: 'social_link_click',
              parameters: {
                'social_type': socialItems[index].tag,
                'url': socialItems[index].url,
                'source': 'mobile_drawer',
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
}
