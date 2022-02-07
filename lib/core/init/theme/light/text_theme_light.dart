import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/init/theme/dark/color_theme_dark.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    return _instance ??= TextThemeLight.init();
  }

  TextThemeLight.init();

  final TextStyle headline1 =
      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: ColorThemeDark.instance!.darkBlue);
  final TextStyle headline2 = TextStyle(
      fontSize: 30.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: ColorThemeDark.instance!.darkBlue);
  final TextStyle headline3 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: ColorThemeDark.instance!.darkBlue);
  final TextStyle headline4 = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25, color: ColorThemeDark.instance!.darkBlue);
  final TextStyle overline = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: ColorThemeDark.instance!.darkBlue);
  final TextStyle bodyText1 = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: ColorThemeDark.instance!.darkBlue);
  final TextStyle bodyText2 = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25, color: ColorThemeDark.instance!.darkBlue);
}
