import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 管理 App 目前的語系。
///
/// state 為 null 時代表跟隨系統語系(由 MaterialApp 依 supportedLocales 解析),
/// 設定明確的 [Locale] 後即覆蓋為使用者選擇的語系(中 / 英)。
class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() => null;

  /// 設定指定語系。
  void setLocale(Locale? locale) => state = locale;

  /// 在中文與英文之間切換。
  void toggle() {
    final isZh = (state?.languageCode ?? 'en') == 'zh';
    state = Locale(isZh ? 'en' : 'zh');
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale?>(LocaleNotifier.new);
