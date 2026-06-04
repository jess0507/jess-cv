import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/services/analytics_service.dart';
import 'package:jessweb/features/navigation/locale_provider.dart';

/// 單一可選語系的資料(語言代碼、國旗 emoji、顯示名稱)。
class _LocaleOption {
  final String code;
  final String flag;
  final String label;

  const _LocaleOption(this.code, this.flag, this.label);
}

/// 語系選擇器。
///
/// 以「國旗 + 文字」顯示目前語系,點擊後跳出選單可選擇中 / 英。
class LocaleSelector extends ConsumerWidget {
  final Color? color;

  const LocaleSelector({super.key, this.color});

  static const List<_LocaleOption> _options = [
    _LocaleOption('zh', '🇹🇼', '中文'),
    _LocaleOption('en', '🇺🇸', 'English'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch 以在語系變更時重建。
    ref.watch(localeProvider);

    final currentCode = Localizations.localeOf(context).languageCode;
    final current = _options.firstWhere(
      (o) => o.code == currentCode,
      orElse: () => _options.first,
    );
    final color = this.color ?? AppColors.secondaryColor;

    return PopupMenuButton<String>(
      tooltip: '',
      position: PopupMenuPosition.under,
      onSelected: (code) {
        ref.read(localeProvider.notifier).setLocale(Locale(code));
        AnalyticsService().logEvent(
          name: 'locale_changed',
          parameters: {'locale': code},
        );
      },
      itemBuilder: (context) => _options.map((o) {
        final isSelected = o.code == currentCode;
        return PopupMenuItem<String>(
          value: o.code,
          child: Row(
            children: [
              Text(o.flag, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              Text(
                o.label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 10),
                Icon(Icons.check, size: 16, color: AppColors.primary200),
              ],
            ],
          ),
        );
      }).toList(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(current.flag, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Text(
            current.label,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
          Icon(Icons.arrow_drop_down, color: color),
        ],
      ),
    );
  }
}
