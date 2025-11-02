import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resume/app.dart';
import 'package:resume/data/locale_service.dart';
import 'package:resume/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  LocaleService().setLocale(locale.languageCode);
  await LocaleService().load();

  runApp(
    const ProviderScope(
      child: ResumeApp(),
    ),
  );
}
