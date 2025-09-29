import 'package:go_router/go_router.dart';
import 'package:resume/ui/portfolio/portfolio_page.dart';
import 'package:resume/ui/scaffold_with_nav.dart';
import 'package:resume/ui/home/home_page.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    ShellRoute(
        builder: (context, state, child) => ScaffoldWithNav(child: child),
        routes: [
          GoRoute(
            path: HomePage.path,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: PortfolioPage.path,
            builder: (context, state) => const PortfolioPage(),
          ),
        ]),
  ],
);
