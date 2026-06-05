import 'package:flutter/material.dart';

/// 顯示於畫面右下角的版本號標籤。
class VersionBadge extends StatelessWidget {
  const VersionBadge({super.key, required this.version});

  final String version;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        child: Text(
          version,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
