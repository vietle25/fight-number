import 'package:flutter/material.dart';

class AppColors {
  // Method get color from hex
  static Color getColorFromHex(String value) => _HexColor(value);

  // Color
  static const Color primary = Color(0xFF0390FF);
  static const Color primaryLight = Color(0xff52b3da);
  static const Color background = Color(0xFFE5E5E5);
  static const Color border = Color(0xFFD8D8D8);
  static const Color iconPrimary = Color(0xFF181818);

  static const Color black = Color(0xFF000000);
  static const Color greyBlack = Color(0xFF1E1E1E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF0000);
  static const Color blue = Color(0xFF0000FF);
  static const Color green = Color(0xFF4CAF50);
  static const Color orange = Color(0xFFF76B22);
  static const Color transparent = Color(0x00000000);

  static const Color text = Color(0xFF262626);
  static const Color textGrey = Color(0xFF333232);
  static const Color hintText = Color.fromRGBO(162, 162, 162, 0.7);

  static const Color shadow = Color.fromRGBO(158, 158, 158, 0.4);
  static const Color disabled = Color.fromRGBO(0, 0, 0, 0.04);

  static const Color blue50 = Color(0xFFE6E9F3);
  static const Color blue800 = Color(0xff162330);

  static const Color grey = Color(0xFF9E9E9E);
  static const Color grey50 = Color(0xFFF2F2F2);
  static const Color grey100 = Color(0xFFE9E9E9);
  static const Color grey200 = Color(0xFFD9D9D9);
  static const Color grey400 = Color(0xFF9D9D9D);
  static const Color grey500 = Color(0xFF7e7e7e);
  static const Color grey700 = Color(0xff646464);
  static const Color grey800 = Color(0xff393939);

  static const Color blueGrey200 = Color(0xFF5B7482);
  static const Color blueGrey400 = Color(0xFF4B6472);
  static const Color blueGrey500 = Color(0xFF344855);
  static const Color blueGrey600 = Color(0xFF243845);
  static const Color blueGrey800 = Color(0xFF222F33);

  static const Color buttonSecondary = Color(0xFF758a9b);
}

// Parse hex to color.
class _HexColor extends Color {
  static int _getColorFromHex(hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  _HexColor(value) : super(_getColorFromHex(value));
}
