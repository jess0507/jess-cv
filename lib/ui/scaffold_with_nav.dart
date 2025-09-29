import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/ui/home/home_page.dart';
import 'package:resume/ui/portfolio/portfolio_page.dart';
import 'package:resume/ui/nav/mobile/app_drawer.dart';
import 'package:resume/ui/nav/mobile/mobile_navigation_button.dart';
import 'package:resume/ui/nav/web/web_navigation_bar.dart';

import '../domain/nav_item.dart';

const webWidthAspectRatio = 0.7;

typedef OnTapNavItem = void Function(NavItemData);

class ScaffoldWithNav extends StatefulWidget {
  final Widget child;
  final bool isMobile;
  final List<NavItemData> navItems;

  ScaffoldWithNav({
    required this.child,
    this.isMobile = true,
    super.key,
  }) : navItems = [
          NavItemData(key: 'home', isSelected: true, path: HomePage.path),
          NavItemData(key: 'portfolio', path: PortfolioPage.path),
        ];

  @override
  State<ScaffoldWithNav> createState() => _ScaffoldWithNavState();
}

class _ScaffoldWithNavState extends State<ScaffoldWithNav>
    with SingleTickerProviderStateMixin {
  List<NavItemData> navItems = [];

  @override
  void initState() {
    navItems = widget.navItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              navItems: navItems,
              onTapNavItem: onTapNavItem,
            );
          } else {
            return Container();
          }
        },
      ),
      body: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            final isMobile = screenWidth < RefinedBreakpoints().tabletSmall;
            final containerWidth =
                isMobile ? screenWidth : screenWidth * webWidthAspectRatio;

            return Stack(
              children: [
                Column(
                  children: [
                    if (isMobile)
                      MobileNavigationbutton(
                        onTapDrawer: () {
                          final isDrawerOpen =
                              Scaffold.of(context).isDrawerOpen;
                          if (isDrawerOpen) {
                            Scaffold.of(context).openDrawer();
                          } else {
                            Scaffold.of(context).openEndDrawer();
                          }
                        },
                      )
                    else
                      WebNavigationBar(
                        navItems: navItems,
                        onTapNavItem: onTapNavItem,
                      ),
                    Expanded(
                      child: SizedBox(
                        width: containerWidth,
                        child: widget.child,
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }

  void onTapNavItem(NavItemData navItem) {
    final newItems = widget.navItems
        .map((NavItemData e) => e.copy(isSelected: e.key == navItem.key))
        .toList();
    setState(() {
      navItems = newItems;
    });
    context.go(navItem.path);
  }
}
