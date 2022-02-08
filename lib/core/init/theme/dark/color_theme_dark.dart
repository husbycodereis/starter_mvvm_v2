import 'package:flutter/material.dart';

class ColorThemeDark {
  static ColorThemeDark? _instance;
  static ColorThemeDark? get instance {
    return _instance ??= ColorThemeDark.init();
  }

  ColorThemeDark.init();

  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color gray = const Color(0xffa5a6ae);
  final Color lightGray = const Color(0xfffffeff);
  final Color darkGrey = const Color(0xff535965);
  final Color black = const Color(0xff020306);
  final Color azure = const Color(0xff3fc4eb);
  final Color darkBlue = const Color(0xff040f24);
  final Color darkBlueShade = const Color(0xFF081D45);
  final Color whiteShade = const Color(0xffedf1fc);
  final Color darkBlueSecondary = const Color(0xff19223C);
  final Color darkBlueSecondaryShade = const Color(0xff2C3B5A);

  ColorScheme get colorScheme => ColorScheme(
      primary: darkBlue, //xx
      primaryVariant: darkBlue,
      secondary: azure, //xx
      secondaryVariant: azure, //xx
      surface: darkBlue,
      background: darkBlue, //xx
      error: red,
      onPrimary: azure, //changes the color of text inside elevated button
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: whiteShade,
      onError: Colors.green,
      brightness: Brightness.dark);
}
