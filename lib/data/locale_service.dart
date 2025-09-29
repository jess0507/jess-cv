import 'dart:convert';

import 'package:flutter/services.dart';

class LocaleService {
  static final _instance = LocaleService._();
  factory LocaleService() => _instance;
  LocaleService._();

  static final defaultLanguageCode = 'en';
  String _languageCode = defaultLanguageCode;
  Map<String, String> _localizedString = {};

  void setLocale(String languageCode) {
    _languageCode = languageCode;
  }

  Future<void> load() async {
    final String jsonString =
        await rootBundle.loadString('assets/lang/$_languageCode.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String getText(String key) => _localizedString[key] ?? key;
}
