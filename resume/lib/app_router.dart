import 'package:go_router/go_router.dart';
import 'package:resume/screens/career_section.dart';
import 'package:resume/screens/education_section.dart';
import 'package:resume/screens/skills_section.dart';
import 'package:resume/screens/resume_scaffold.dart';
import 'package:resume/screens/about_me_section.dart';

final goRouter = GoRouter(
  initialLocation: '/info',
  routes: [
    ShellRoute(
        builder: (context, state, child) => ScaffoldWithNavBar(child: child),
        routes: [
          GoRoute(
            path: '/info',
            builder: (context, state) => const AboutMeSection(),
          ),
          GoRoute(
            path: '/career',
            builder: (context, state) => const CareerSection(),
          ),
          GoRoute(
            path: '/education',
            builder: (context, state) => const EducationSection(),
          ),
          GoRoute(
            path: '/skills',
            builder: (context, state) => const SkillsSection(),
          ),
          GoRoute(
            path: '/portfolio',
            builder: (context, state) => const AboutMeSection(),
          ),
        ]),
  ],
);
