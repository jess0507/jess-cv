import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/router/app_router.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/core/services/device_info_service.dart';
import 'package:jessweb/core/theme/app_theme.dart';
import 'package:jessweb/data/models/portfolio_data.dart';
import 'package:jessweb/data/providers/portfolio_provider.dart';
import 'package:jessweb/features/locale/locale_provider.dart';
import 'package:jessweb/l10n/app_localizations.dart';

class JessApp extends HookConsumerWidget {
  const JessApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MaterialApp 之上的 context 沒有 ScaffoldMessenger,
    // 透過 key 取得 messenger state 來顯示 SnackBar。
    final scaffoldMessengerKey =
        useMemoized(() => GlobalKey<ScaffoldMessengerState>());

    void handlePortfolioState(AsyncValue<PortfolioData> value) {
      value.whenOrNull(
        error: (error, _) {
          const message = '資料載入失敗,請稍後再試';
          scaffoldMessengerKey.currentState
            ?..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text(message)));
        },
      );
    }

    useEffect(() {
      // App Opened - 記錄裝置資訊
      Future<void> logAppOpened() async {
        final analytics = AnalyticsService();
        final deviceInfo = DeviceInfoService();
        final deviceData = await deviceInfo.getDeviceInfo();

        await analytics.logEvent(
          name: 'app_opened',
          parameters: deviceData,
        );
      }

      logAppOpened();

      // fireImmediately 讓初始狀態(含首次載入)也能即時反映,
      // 後續狀態切換(載入完成 / 錯誤 / 重新整理)亦由此監聽。
      // 用 listenManual 是因為 WidgetRef.listen 不支援 fireImmediately。
      final subscription = ref.listenManual(
        portfolioProvider,
        (previous, next) => handlePortfolioState(next),
        fireImmediately: true,
      );
      return subscription.close;
    }, []);

    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: AppTheme.lightThemeData,
      routerConfig: goRouter,
    );
  }
}
