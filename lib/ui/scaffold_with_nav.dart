import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/ui/home/home_page.dart';
import 'package:resume/ui/home/skill_section.dart';
import 'package:resume/ui/project/project_page.dart';
import 'package:resume/ui/nav/mobile/app_drawer.dart';
import 'package:resume/ui/nav/mobile/mobile_navigation_button.dart';
import 'package:resume/ui/nav/web/web_navigation_bar.dart';

import '../domain/nav_data.dart';

typedef OnTapNavItem = void Function(NavData);

class ScaffoldWithNav extends StatefulWidget {
  final bool isMobile;

  const ScaffoldWithNav({
    this.isMobile = true,
    super.key,
  });

  @override
  State<ScaffoldWithNav> createState() => _ScaffoldWithNavState();
}

class _ScaffoldWithNavState extends State<ScaffoldWithNav>
    with SingleTickerProviderStateMixin {
  String selectedKey = 'home';
  List<NavData> navItems = [
    NavData(
      key: 'home',
      isSelected: true,
      path: HomePage.path,
      globalKey: GlobalKey(),
    ),
    NavData(
      key: 'projects',
      path: ProjectPage.path,
      globalKey: GlobalKey(),
    ),
    NavData(
      key: 'skills',
      path: SkillSection.path,
      globalKey: GlobalKey(),
    ),
  ];
  final scrollController = ScrollController();

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
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: HomePage(navItems: navItems),
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }

  void onTapNavItem(NavData navItem) {
    final newItems = navItems
        .map((NavData e) => e.copy(isSelected: e.key == navItem.key))
        .toList();
    setState(() {
      navItems = newItems;
      selectedKey = navItem.key;
    });

    Scrollable.ensureVisible(
      navItem.globalKey.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
