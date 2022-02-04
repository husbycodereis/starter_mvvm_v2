import 'package:flutter/material.dart';
import 'package:movies_catalog/core/init/theme/dark/color_theme_dark.dart';

class TextThemeDark {
  static TextThemeDark? _instance;
  static TextThemeDark get instance {
    return _instance ??= TextThemeDark.init();
  }

  TextThemeDark.init();

  final TextStyle headline1 =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: ColorThemeDark.instance!.white);
  final TextStyle headline2 = const TextStyle(fontSize: 30, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline4 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle overline = const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
  final TextStyle bodyText1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: ColorThemeDark.instance!.white);
  final TextStyle bodyText2 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
}
