import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._internal();
  factory DeviceInfoService() => _instance;
  DeviceInfoService._internal();

  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<Map<String, String>> getDeviceInfo() async {
    final Map<String, String> deviceData = {};

    try {
      if (kIsWeb) {
        final webInfo = await _deviceInfo.webBrowserInfo;
        deviceData['platform'] = 'web';
        deviceData['browser_name'] = webInfo.browserName.name;
        deviceData['user_agent'] = webInfo.userAgent ?? 'unknown';
        deviceData['vendor'] = webInfo.vendor ?? 'unknown';
        deviceData['language'] = webInfo.language ?? 'unknown';
        deviceData['platform_type'] = webInfo.platform ?? 'unknown';
      } else if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        deviceData['platform'] = 'android';
        deviceData['model'] = androidInfo.model;
        deviceData['manufacturer'] = androidInfo.manufacturer;
        deviceData['android_version'] = androidInfo.version.release;
        deviceData['sdk_int'] = androidInfo.version.sdkInt.toString();
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        deviceData['platform'] = 'ios';
        deviceData['model'] = iosInfo.model;
        deviceData['system_name'] = iosInfo.systemName;
        deviceData['system_version'] = iosInfo.systemVersion;
        deviceData['name'] = iosInfo.name;
      } else if (Platform.isMacOS) {
        final macInfo = await _deviceInfo.macOsInfo;
        deviceData['platform'] = 'macos';
        deviceData['model'] = macInfo.model;
        deviceData['host_name'] = macInfo.hostName;
        deviceData['os_release'] = macInfo.osRelease;
      } else if (Platform.isWindows) {
        final windowsInfo = await _deviceInfo.windowsInfo;
        deviceData['platform'] = 'windows';
        deviceData['computer_name'] = windowsInfo.computerName;
      } else if (Platform.isLinux) {
        final linuxInfo = await _deviceInfo.linuxInfo;
        deviceData['platform'] = 'linux';
        deviceData['name'] = linuxInfo.name;
        deviceData['version'] = linuxInfo.version ?? 'unknown';
      }
    } catch (e) {
      deviceData['error'] = e.toString();
    }

    return deviceData;
  }

  Future<String> getUserAgent() async {
    try {
      if (kIsWeb) {
        final webInfo = await _deviceInfo.webBrowserInfo;
        return webInfo.userAgent ?? 'unknown';
      }
    } catch (e) {
      return 'error: $e';
    }
    return 'not_web_platform';
  }
}
