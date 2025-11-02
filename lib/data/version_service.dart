import 'package:package_info_plus/package_info_plus.dart';

class VersionService {
  static final VersionService _instance = VersionService._internal();
  factory VersionService() => _instance;
  VersionService._internal();

  /// 取得顯示用的版本號
  /// 優先使用 git tag，若無則使用 pubspec.yaml 的版本
  Future<String> getDisplayVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    // 這裡會顯示 pubspec.yaml 中的版本
    // 如果你有設定 git tag，可以在建置時透過 build script 更新
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    // 格式: v1.0.0 (build 1)
    if (buildNumber.isNotEmpty && buildNumber != '0') {
      return 'v$version+$buildNumber';
    }

    return 'v$version';
  }

  /// 取得簡短版本號（只有版本，不含 build number）
  Future<String> getShortVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return 'v${packageInfo.version}';
  }

  /// 取得完整的版本資訊
  Future<Map<String, String>> getVersionInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return {
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
    };
  }
}
