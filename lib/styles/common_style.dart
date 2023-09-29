import 'package:fight_number/values/colors.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/values/fonts.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

abstract class CommonStyle {
  /// Text medium
  static TextStyle textSmall({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
      fontSize: size ?? 14,
      color: color ?? Colors.white,
      fontFamily: Fonts.fontThin,
      fontWeight: weight ?? FontWeight.w500,
    );
  }

  /// Text medium
  static TextStyle text({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
      fontSize: size ?? 18.sp,
      color: color ?? Colors.white,
      fontFamily: Fonts.fontNormal,
      fontWeight: weight ?? FontWeight.w600,
      letterSpacing: 0.6,
      wordSpacing: 1,
    );
  }

  /// Text medium bold
  static TextStyle textMediumBold({Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: Fonts.font16,
      fontWeight: FontWeight.w600,
    );
  }

  /// Text large
  static TextStyle textLarge({Color? color, double size = 20}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontFamily: Fonts.fontNormal,
      fontSize: size,
    );
  }

  /// Text large bold
  static TextStyle textLargeBold({Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: Fonts.font20,
      fontFamily: Fonts.fontBold,
      fontWeight: FontWeight.w600,
    );
  }

  /// Text large
  static TextStyle textXLarge({Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: Fonts.font24,
    );
  }

  /// Text large bold
  static TextStyle textXLargeBold({Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: Fonts.font24,
      fontFamily: Fonts.fontBold,
      fontWeight: FontWeight.w500,
    );
  }

  /// Shadow offset
  static BoxShadow shadowOffset({double? blurRadius}) {
    return BoxShadow(
      color: AppColors.shadow,
      spreadRadius: 0,
      blurRadius: blurRadius ?? Constants.elevation,
      offset: Offset(0, 2), // changes position of shadow
    );
  }

  /// Text error
  static const textError = TextStyle(
    fontSize: Fonts.font12,
    color: AppColors.red,
  );

  /// Text title
  static TextStyle title({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
      fontSize: size ?? 72,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? Colors.white,
      fontStyle: FontStyle.italic,
      fontFamily: Fonts.fontTitle,
    );
  }
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle hintStyle() => copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontStyle: FontStyle.italic,
      );

  TextStyle weight(FontWeight font) => copyWith(fontWeight: font);

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle setColor(Color color) => copyWith(color: color);

  TextStyle comfort() => copyWith(height: 1.8);

  TextStyle dense() => copyWith(height: 1.2);
}
