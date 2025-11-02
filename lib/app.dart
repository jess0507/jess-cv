import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume/ui/app_theme.dart';
import 'package:resume/data/locale_service.dart';
import 'package:resume/data/analytics_service.dart';
import 'package:resume/data/device_info_service.dart';

import 'ui/app_router.dart';

class ResumeApp extends HookConsumerWidget {
  const ResumeApp({super.key});

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

    return MaterialApp.router(
      onGenerateTitle: (context) => LocaleService().getText('appTitle'),
      theme: AppTheme.lightThemeData,
      routerConfig: goRouter,
    );
  }
}
