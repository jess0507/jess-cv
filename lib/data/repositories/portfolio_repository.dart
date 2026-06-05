import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jessweb/data/models/portfolio_data.dart';

/// 從 Firestore 讀取並解析 portfolio 資料。
///
/// 資料位置:collection `config` / doc `portfolio` / 欄位 `data`。
class PortfolioRepository {
  static const String _collection = 'config';
  static const String _document = 'portfolio';
  static const String _field = 'data';

  /// 讀取 Firestore 文件、解析成 [PortfolioData]。
  static Future<PortfolioData> load() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(_collection)
        .doc(_document)
        .get();

    final docData = snapshot.data();
    if (docData == null) {
      throw StateError('Firestore 文件 $_collection/$_document 不存在');
    }

    final rawData = docData[_field];

    // `data` 欄位可能是 Map,也可能是存成 JSON 字串。
    final Map<String, dynamic> data;
    if (rawData is Map<String, dynamic>) {
      data = rawData;
    } else if (rawData is String) {
      final decoded = jsonDecode(rawData);
      if (decoded is! Map<String, dynamic>) {
        throw StateError(
          'Firestore 文件 $_collection/$_document 的 `$_field` 字串非 JSON 物件',
        );
      }
      data = decoded;
    } else {
      throw StateError(
        'Firestore 文件 $_collection/$_document 缺少 Map 或 JSON 字串型別的 `$_field` 欄位',
      );
    }

    return PortfolioData.fromJson(data);
  }
}
