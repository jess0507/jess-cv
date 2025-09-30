import 'package:go_router/go_router.dart';
import 'package:resume/ui/scaffold_with_nav.dart';
import 'package:resume/ui/home/home_page.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const ScaffoldWithNav(),
    ),
  ],
);
