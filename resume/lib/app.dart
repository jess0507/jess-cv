import 'package:flutter/material.dart';
import 'package:resume/app_router.dart';
import 'package:resume/app_theme.dart';

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Jess Yen',
      theme: AppTheme.lightThemeData,
      routerConfig: goRouter,
    );
  }
}
