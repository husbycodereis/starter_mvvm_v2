import 'package:flutter/material.dart';
import '../../../extensions/string_extensions.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight get instance {
    return _instance ??= ColorThemeLight.init();
  }

  ColorThemeLight.init();

  final Color brown = 'a87e6f'.color;
  final Color red = const Color(0xFFCC2041);
  final Color white = const Color(0xffffffff);
  final Color grey = const Color(0xffF1F3F8);
  final Color lightGrey = const Color(0xffF1F3F8);
  final Color darkGrey = const Color(0xff676870);
  final Color black = const Color(0xff020306);
   final Color azure = const Color(0xff3fc4eb);
  final Color darkBlue = const Color(0xff040f24);
  final Color whiteShade = const Color(0xffedf1fc);

  ColorScheme get colorScheme => ColorScheme(
      primary: whiteShade, //xx
      primaryVariant: whiteShade,
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
      brightness: Brightness.light);
}
