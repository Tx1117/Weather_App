import 'package:universal_platform/universal_platform.dart';

class PlatformConfig {
  static bool get isWeb => UniversalPlatform.isWeb;
  static bool get isAndroid => UniversalPlatform.isAndroid;
  static bool get isIOS => UniversalPlatform.isIOS;
  static bool get isWindows => UniversalPlatform.isWindows;
  static bool get isMacOS => UniversalPlatform.isMacOS;
  static bool get isLinux => UniversalPlatform.isLinux;
  static bool get isMobile =>
      UniversalPlatform.isAndroid || UniversalPlatform.isIOS;
  static bool get isDesktop =>
      UniversalPlatform.isWindows ||
      UniversalPlatform.isMacOS ||
      UniversalPlatform.isLinux;

  static String get platformName {
    if (isWeb) return 'Web';
    if (isAndroid) return 'Android';
    if (isIOS) return 'iOS';
    if (isWindows) return 'Windows';
    if (isMacOS) return 'macOS';
    if (isLinux) return 'Linux';
    return 'Unknown';
  }

  static bool get supportsLocationServices {
    return isMobile || isDesktop;
  }

  static String get locationErrorMessage {
    if (isWeb) {
      return 'Location services are not available on web. Please search for a city instead.';
    } else if (isMobile) {
      return 'Location services are disabled or permissions are denied. Please enable location services in your device settings.';
    } else {
      return 'Location services are not available on this platform. Please search for a city instead.';
    }
  }

  static Map<String, dynamic> get defaultSettings {
    return {
      'defaultCity': 'London',
      'units': 'metric', // Celsius
      'language': 'en',
      'refreshInterval': 30, // minutes
    };
  }
}
