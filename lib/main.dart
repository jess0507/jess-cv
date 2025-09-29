import 'package:flutter/material.dart';
import 'package:resume/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resume/data/locale_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  LocaleService().setLocale(locale.languageCode);
  await LocaleService().load();
  runApp(const ResumeApp());
}
