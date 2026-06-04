import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/app/core/utils/l10n_helper.dart';
import 'package:resume/app/core/widgets/nimbus_info_section.dart';
import 'package:resume/app/core/widgets/spaces.dart';
import 'package:resume/app/domain/nav_data.dart';
import 'package:resume/app/ui/home/info_section.dart';
import 'package:resume/app/ui/home/project/project_page.dart';
import 'package:resume/app/ui/home/skill_section.dart';

const webScreenRatioForPadding = 0.15;
const mobileScreenRatioForPadding = 0.1;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.navItems,
  });

  static const path = '/home';
  final List<NavData> navItems;

  @override
  Widget build(BuildContext context) {
    final tr = trWithContext(context);
    return SingleChildScrollView(
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          final isMobile = screenWidth < RefinedBreakpoints().tabletSmall;
          final padding = isMobile
              ? screenWidth * mobileScreenRatioForPadding
              : screenWidth * webScreenRatioForPadding;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                key: navItems.where((e) => e.key == 'home').first.globalKey,
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: InfoSection(),
              ),
              SpaceH110(),
              Padding(
                key: navItems.where((e) => e.key == 'projects').first.globalKey,
                padding: EdgeInsets.only(left: padding, top: 16),
                child: NimbusInfoSection(
                  sectionTitle: tr.myWorks,
                  title1: tr.meetMyProjects,
                  hasTitle2: false,
                  body: tr.projectsSubtitle,
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
                child: ProjectPage(),
              ),
              SpaceH110(),
              Padding(
                key: navItems.where((e) => e.key == 'skills').first.globalKey,
                padding: EdgeInsets.only(left: padding),
                child: NimbusInfoSection(
                  sectionTitle: tr.mySkills,
                  title1: tr.whatMyDesignSkillsInclude,
                  hasTitle2: false,
                  body: tr.skillsSubtitle,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
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
