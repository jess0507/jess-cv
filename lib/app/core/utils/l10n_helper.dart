import 'package:flutter/widgets.dart';
import 'package:jessweb/l10n/app_localizations.dart';

/// 取得目前 context 的 AppLocalizations(nullable-getter: false,保證非空)。
/// 用法:tr.home
AppLocalizations trWithContext(BuildContext context) =>
    AppLocalizations.of(context);

extension NavLabelX on AppLocalizations {
  /// nav 項目以字串 key 儲存(home / projects / skills),
  /// gen_l10n 只有靜態 getter,這裡用 key 對應到對應的翻譯。
  String navLabel(String key) {
    switch (key) {
      case 'home':
        return home;
      case 'projects':
        return projects;
      case 'skills':
        return skills;
      default:
        return key;
    }
  }
}
