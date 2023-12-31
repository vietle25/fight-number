import 'dart:io';

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:fight_number/styles/extend_theme.dart';
import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    // primaryColor: Colors.primaryDark,
    primaryColorLight: const Color(0xff2492be),
    // backgroundColor: Colors.backgroundDark,
    platform: Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
    brightness: Brightness.dark,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromRGBO(154, 154, 154, 0.7019607843137254),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Constants.cornerRadius),
        ),
      ),
    ),
    dividerColor: AppColors.black,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Color(0xFFF8F9FA),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF8F9FA),
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF8F9FA),
      ),
      labelLarge: TextStyle(
        color: Color(0xFFF8F9FA),
      ),
      labelMedium: TextStyle(
        color: Color(0xFFF8F9FA),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF4B6472),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFC7C7C7),
    ),
    extensions: <ThemeExtension<dynamic>>[
      const ExtendTheme(
        inputBackground: Color(0xFF4B6472),
        hintColor: Color.fromRGBO(215, 215, 215, 0.7019607843137254),
        buttonColor: Color(0xff124e67),
        iconSecondColor: Color(0xFFC7C7C7),
        errorTextColor: Color(0xFFF1F1F1),
        unseenTextColor: Color(0xFFFFFFFF),
        seenTextColor: Color(0xFFB6B6B6),
        inputMessageColor: Color(0xFF4B6472),
        messageColor: Color(0xFF4B606B),
        hrColor: Color(0xFF253342),
        buttonTextColor: Color(0xFFDEDEDE),
      ),
    ],
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryLight,
    primaryColorLight: const Color(0xff3ca8d2),
    backgroundColor: AppColors.background,
    platform: Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Color(0xFF262626),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF262626),
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF262626),
      ),
      labelLarge: TextStyle(
        color: Color(0xFF262626),
      ),
      labelMedium: TextStyle(
        color: Color(0xFF262626),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF2884a9),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF151515),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    errorColor: AppColors.red,
    dialogBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.transparent,
      elevation: 0,
      iconTheme: ThemeData().iconTheme,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7019607843137254),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Constants.cornerRadius),
        ),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      const ExtendTheme(
        inputBackground: Color(0xFFE9E9E9),
        hintColor: Color.fromRGBO(162, 162, 162, 0.7),
        buttonColor: Color(0xFF2884a9),
        iconSecondColor: Color(0xFFFFFFFF),
        errorTextColor: Color(0xFFF32020),
        unseenTextColor: Color(0xFF000000),
        seenTextColor: Color(0xFF707070),
        inputMessageColor: Color(0xFFC7C7C7),
        messageColor: Color(0x93D7D5D5),
        hrColor: Color(0xFFE3E3E3),
        buttonTextColor: Color(0xFFF8F8F8),
      ),
    ],
  );
}
