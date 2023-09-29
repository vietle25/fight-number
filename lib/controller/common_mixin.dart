import 'package:fight_number/styles/extend_theme.dart';
import 'package:flutter/material.dart';

mixin ItemMixin {
  ThemeData getTheme(BuildContext context) => Theme.of(context);

  ExtendTheme getExtTheme(BuildContext context) =>
      Theme.of(context).extension<ExtendTheme>()!;
}
