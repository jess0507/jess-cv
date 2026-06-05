import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:jessweb/features/home/home_page.dart';
import 'package:jessweb/features/navigation/scaffold_with_nav.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  // 讓 BotToast 能在路由切換時正確管理 toast。
  observers: [BotToastNavigatorObserver()],
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const ScaffoldWithNav(),
    ),
  ],
);
