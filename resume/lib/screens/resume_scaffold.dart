import 'package:flutter/material.dart';
import 'package:resume/screens/about_me_section.dart';
import 'package:resume/screens/career_section.dart';
import 'package:resume/screens/education_section.dart';
import 'package:resume/screens/nav_section_web.dart';
import 'package:resume/screens/portfolio_section.dart';
import 'package:resume/screens/program_section.dart';
import 'package:resume/screens/skills_section.dart';
import 'package:resume/utils/adaptive.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/nav_item.dart';
import 'package:resume/widgets/spaces.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.path,
      {this.isSelected = false, this.selectedIcon});

  final String label;
  final Widget icon;
  final Widget? selectedIcon;
  final String path;
  final bool isSelected;
}

final List<NavItemData> navItems = [
  NavItemData(name: StringConst.ABOUT, key: GlobalKey(), isSelected: true),
  NavItemData(name: StringConst.CAREER, key: GlobalKey()),
  NavItemData(name: StringConst.EDUCATION, key: GlobalKey()),
  NavItemData(name: StringConst.SKILLS, key: GlobalKey()),
  NavItemData(name: StringConst.PORTFOLIO, key: GlobalKey()),
];

const double indicatorWidth = Sizes.WIDTH_60;

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget child;
  final bool isMobile;

  const ScaffoldWithNavBar(
      {required this.child, this.isMobile = true, super.key});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;

    List<Color> colors = [
      AppColors.yellow10,
      AppColors.yellow100,
      AppColors.yellow300,
      AppColors.yellow10,
      AppColors.yellow100,
    ];

    List<Widget> sections = [
      AboutMeSection(),
      CareerSection(),
      EducationSection(),
      Column(
        children: [
          SkillsSection(),
          SpaceH40(),
          ProgramSection(),
        ],
      ),
      PortfolioSection(),
    ];

    return Scaffold(
      body: Column(
        children: [
          NavSectionWeb(
            navItems: navItems,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ...sections.map(
                    (section) {
                      final index = sections.indexOf(section);
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: assignWidth(context, 0.1),
                          vertical: spacerHeight,
                        ),
                        key: navItems[index].key,
                        // color: colors[index],
                        child: section,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
