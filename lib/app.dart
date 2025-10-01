import 'package:flutter/material.dart';
// import 'package:resume/ui/app_router.dart';
import 'package:resume/ui/app_theme.dart';
import 'package:resume/data/locale_service.dart';

import 'ui/app_router.dart';

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => LocaleService().getText('appTitle'),
      theme: AppTheme.lightThemeData,
      routerConfig: goRouter,
    );
  }
}
