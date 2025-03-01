import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Fail to launch: $url';
  }
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

EdgeInsets getSectionPadding() {
  return EdgeInsets.symmetric(horizontal: 20, vertical: 8);
}
