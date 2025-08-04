import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static bool isWeb() {
    return UniversalPlatform.isWeb;
  }

  static bool isAndroid() {
    return UniversalPlatform.isAndroid;
  }

  static bool isIOS() {
    return UniversalPlatform.isIOS;
  }

  static double getCardWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 400;
    } else if (isTablet(context)) {
      return 350;
    } else {
      return MediaQuery.of(context).size.width - 32;
    }
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.all(24.0);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(20.0);
    } else {
      return const EdgeInsets.all(16.0);
    }
  }

  static double getFontSize(BuildContext context, double baseSize) {
    if (isDesktop(context)) {
      return baseSize * 1.2;
    } else if (isTablet(context)) {
      return baseSize * 1.1;
    } else {
      return baseSize;
    }
  }
}
