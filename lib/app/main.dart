import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/app/app.dart';
import 'package:jessweb/app/data/resume_repository.dart';
import 'package:jessweb/app/firebase_options.dart';
import 'package:jessweb/app/providers/resume_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 從 assets/data/resume_data.json 載入要顯示的資料
  final resumeData = await ResumeRepository.load();

  runApp(
    ProviderScope(
      overrides: [
        resumeDataProvider.overrideWithValue(resumeData),
      ],
      child: const JessApp(),
    ),
  );
}
