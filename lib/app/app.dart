import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume/app/data/analytics_service.dart';
import 'package:resume/app/data/device_info_service.dart';
import 'package:resume/app/providers/locale_provider.dart';
import 'package:resume/app/ui/app_theme.dart';
import 'package:resume/l10n/app_localizations.dart';

import 'ui/app_router.dart';

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
