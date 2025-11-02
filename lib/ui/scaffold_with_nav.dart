import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/ui/home/home_page.dart';
import 'package:resume/ui/home/skill_section.dart';
import 'package:resume/ui/components/navigation/mobile/app_drawer.dart';
import 'package:resume/ui/components/navigation/mobile/mobile_navigation_button.dart';
import 'package:resume/ui/components/navigation/web/web_navigation_bar.dart';
import 'package:resume/data/version_service.dart';
import 'package:resume/data/analytics_service.dart';

import '../domain/nav_data.dart';
import 'home/project/project_page.dart';

typedef OnTapNavItem = void Function(NavData);

class ScaffoldWithNav extends HookConsumerWidget {
  final bool isMobile;

  const ScaffoldWithNav({
    this.isMobile = true,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navItems = useState<List<NavData>>([
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
    ]);
    final scrollController = useScrollController();
    final versionSnapshot = useFuture(
      useMemoized(() => VersionService().getDisplayVersion()),
    );

    void onTapNavItem(NavData navItem) {
      AnalyticsService().logEvent(
        name: 'navigation_clicked',
        parameters: {
          'nav_item': navItem.key,
          'nav_path': navItem.path,
        },
      );

      final newItems = navItems.value
          .map((NavData e) => e.copy(isSelected: e.key == navItem.key))
          .toList();
      navItems.value = newItems;

      Scrollable.ensureVisible(
        navItem.globalKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    final version = versionSnapshot.hasData ? versionSnapshot.data! : '';

    return Scaffold(
      endDrawer: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              navItems: navItems.value,
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
            final isMobile = screenWidth < RefinedBreakpoints().desktopSmall;

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
                        navItems: navItems.value,
                        onTapNavItem: onTapNavItem,
                      ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: HomePage(navItems: navItems.value),
                      ),
                    )
                  ],
                ),
                if (version.isNotEmpty)
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Text(
                        version,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }),
    );
  }
}
