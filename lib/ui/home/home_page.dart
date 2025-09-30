import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/core/widgets/nimbus_info_section.dart';
import 'package:resume/core/widgets/spaces.dart';
import 'package:resume/data/locale_service.dart';
import 'package:resume/domain/nav_data.dart';
import 'package:resume/ui/home/info_section.dart';
import 'package:resume/ui/home/skill_section.dart';
import 'package:resume/ui/project/project_page.dart';

const webScreenRatioForPadding = 0.15;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.navItems,
  });

  static const path = '/home';
  final List<NavData> navItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width *
              (1 - webScreenRatioForPadding * 2);
          final isMobile = screenWidth < RefinedBreakpoints().tabletSmall;
          final padding = screenWidth * webScreenRatioForPadding;
          final infoPadding = isMobile ? padding : padding * 2;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                key: navItems.where((e) => e.key == 'home').first.globalKey,
                padding: EdgeInsetsGeometry.symmetric(horizontal: infoPadding),
                child: InfoSection(),
              ),
              SpaceH110(),
              Padding(
                key: navItems.where((e) => e.key == 'projects').first.globalKey,
                padding: EdgeInsets.only(left: padding, top: 16),
                child: NimbusInfoSection(
                  sectionTitle: LocaleService().getText("myWorks"),
                  title1: LocaleService().getText("meetMyProjects"),
                  hasTitle2: false,
                  body: LocaleService().getText("projectsSubtitle"),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
                child: ProjectPage(),
              ),
              SpaceH110(),
              Padding(
                key: navItems.where((e) => e.key == 'skills').first.globalKey,
                padding: EdgeInsets.only(left: padding, top: 16),
                child: NimbusInfoSection(
                  sectionTitle: LocaleService().getText("mySkills"),
                  title1: LocaleService().getText("whatMyDesignSkillsInclude"),
                  hasTitle2: false,
                  body: LocaleService().getText("skillsSubtitle"),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsetsGeometry.only(left: padding, top: 16),
                child: SkillSection(),
              ),
              SpaceH110(),
            ],
          );
        },
      ),
    );
  }
}
