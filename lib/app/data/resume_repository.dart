import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'model/resume_data.dart';

/// 從 asset 載入並解析 `resume_data.json`。
class ResumeRepository {
  static const String _assetPath = 'assets/data/resume_data.json';

  /// 讀取 asset 字串、解析成 [ResumeData]。
  static Future<ResumeData> load() async {
    final raw = await rootBundle.loadString(_assetPath);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return ResumeData.fromJson(json);
  }
}
