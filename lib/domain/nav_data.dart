import 'package:flutter/material.dart';

class NavData {
  final String key;
  final bool isSelected;
  final String path;
  final GlobalKey globalKey;

  NavData({
    required this.key,
    this.isSelected = false,
    required this.path,
    required this.globalKey,
  });

  NavData copy({
    String? key,
    bool? isSelected,
    String? path,
    GlobalKey? globalKey,
  }) =>
      NavData(
        key: key ?? this.key,
        isSelected: isSelected ?? this.isSelected,
        path: path ?? this.path,
        globalKey: globalKey ?? this.globalKey,
      );
}
