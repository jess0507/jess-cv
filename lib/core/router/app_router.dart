import 'package:go_router/go_router.dart';
import 'package:jessweb/features/home/home_page.dart';
import 'package:jessweb/features/navigation/scaffold_with_nav.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const ScaffoldWithNav(),
    ),
  ],
);
