import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/app.dart';
import 'package:jessweb/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // portfolio 資料改由 portfolioProvider 初始化時自動載入。
  runApp(
    const ProviderScope(
      child: JessApp(),
    ),
  );
}
