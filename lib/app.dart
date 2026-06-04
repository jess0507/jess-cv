import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/core/services/device_info_service.dart';
import 'package:jessweb/features/navigation/locale_provider.dart';
import 'package:jessweb/core/theme/app_theme.dart';
import 'package:jessweb/l10n/app_localizations.dart';

import 'package:jessweb/core/router/app_router.dart';

class JessApp extends HookConsumerWidget {
  const JessApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      return null;
    }, []);

    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: AppTheme.lightThemeData,
      routerConfig: goRouter,
    );
  }
}
