import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static final String formatDate = 'dd/MM/y';
  static final String formatDateSql = 'y-MM-dd';
  static final String formatDateTimeZone = 'y-MM-dd HH:mm:ssZ';
  static final String formatDateTimeZoneT = 'y-MM-ddTHH:mm:ss.Z';
  static final String formatTime = 'HH:mm';
  static final String formatTimeSecond = 'HH:mm:ss';
  static final String formatA = 'a';
  static final String formatTimeA = 'hh:mm a';
  static final String formatTimeSecondA = 'hh:mm:ss a';
  static final String formatDateTime = '$formatDate $formatTimeSecond';
  static final String formatDateTimeSql = '$formatDateSql $formatTimeSecond';
  static final String formatTimeAWithDate = '$formatTimeA $formatDate';
  static final String formatTimeWithDate = '$formatTime $formatDate';
  static final String formatDayOfWeekDate = 'EEEE';
  static final String formatMonth = 'MMMM';
  static final String formatYear = 'y';
  static final String formatDay = 'dd';
  static final String formatMonth2 = 'MM';
  static final String formatMonthDay = "MMM d";

  /// Get time now
  static DateTime now() {
    return DateTime.now();
  }

  /// Get time of day now
  static TimeOfDay timeNow() {
    return TimeOfDay.now();
  }

  /// Parse now with [format]
  static String parseNow(String format) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat(format);
    return formatter.format(now);
  }

  /// Compare string date with [value1] and [value2]
  static bool compareStringDate(String value1, String value2, String format) {
    DateFormat formatter = DateFormat(format);
    DateTime date1 = DateTime.parse(value1);
    DateTime date2 = DateTime.parse(value2);
    String formatDate1 = formatter.format(date1);
    String formatDate2 = formatter.format(date2);
    if (formatDate1.compareTo(formatDate2) != 0) {
      return true;
    }
    return false;
  }
}
