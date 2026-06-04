import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/resume_data.dart';

/// 提供已載入的履歷資料(連結、社群、技能、專案)。
///
/// 預設拋出例外;實際值由 [main] 在啟動時透過 `ResumeRepository.load()` 載入,
/// 再於 `ProviderScope.overrides` 以 `overrideWithValue` 注入。
final resumeDataProvider = Provider<ResumeData>(
  (ref) => throw UnimplementedError(
    'resumeDataProvider 必須在 ProviderScope.overrides 中覆寫',
  ),
);
