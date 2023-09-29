import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:fight_number/locales/languages.dart';
import 'package:fight_number/model/language_model.dart';
import 'package:fight_number/utils/storage_util.dart';
import 'package:fight_number/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utils {
  /// Checks if data is null.
  static bool isNull(dynamic data) {
    if (data is String &&
        (data.isEmpty || (data.isNotEmpty && data.trim() == ""))) {
      return true;
    }
    return GetUtils.isNull(data);
  }

  /// Check have network connect
  static Future<bool> isNetWorkConnect() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  /// Get width screen
  static double getWidth() => Get.width;

  /// Get height screen
  static double getHeight() => Get.height;

  /// Get status bar height
  static double getStatusBarHeight() => MediaQuery.of(Get.context!).padding.top;

  /// Get width screen percent
  static double getWidthPercent(double percent) => (getWidth() * percent) / 100;

  /// Get height screen percent
  static double getHeightPercent(double percent) =>
      (getHeight() * percent) / 100;

  /// Get language app
  static Future<void> getLocaleLanguageApp() async {
    Globals.language = Language.vietnamese;
    List<String> values = Language.vietnamese.localesCode.split('_');
    if (values.length > 1) {
      return Get.updateLocale(Locale(values[0], values[1]));
    }
  }

  /// Random
  static int random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  /// Random
  static double randomDegree(double degree) {
    var rn = Random();
    int i = 8 + rn.nextInt(50);
    return (i * degree).toDouble();
  }

  /// Random
  static int randomPlayer(int numPlayer) {
    return Random().nextInt(numPlayer);
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();

  /// Get header request
  static getHeaderRequest() {
    Map<String, String> headers = Map<String, String>();
    // headers.addAll({"x-openerp-session-id": Globals.sessionIdChart});
    return headers;
  }

  static isDarkMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }

  /// Update language app
  static void updateLanguage(LanguageModel language) async {
    Globals.language = language;
    await StorageUtil.storeItem(StorageUtil.language, language.toJson());
    List<String> values = Globals.language.localesCode.split('_');
    if (values.length > 1) {
      Get.updateLocale(Locale(values[0], values[1]));
    }
  }

  static const AUTO_ID_ALPHABET =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  static const AUTO_ID_LENGTH = 20;
  static String getAutoId() {
    final buffer = StringBuffer();
    final random = Random.secure();

    final maxRandom = AUTO_ID_ALPHABET.length;

    for (int i = 0; i < AUTO_ID_LENGTH; i++) {
      buffer.write(AUTO_ID_ALPHABET[random.nextInt(maxRandom)]);
    }
    return buffer.toString();
  }

  static bool isTablet() {
// The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(Get.context!).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    return shortestSide > 600;
  }

  static double widthWheel() {
    return buttonWheelWidth() + userWidth() + 6.w;
  }

  static double buttonWheelWidth() {
    return isTablet() ? 30.h : 57.w;
  }

  static double userWidth() {
    return isTablet() ? 6.h : 12.w;
  }
}
