import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    return _instance ??= TextThemeLight.init();
  }

  TextThemeLight.init();

  final TextStyle headline1 = TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold);
  final TextStyle headline2 = TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);
  final TextStyle headline4 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle overline = TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5);
  final TextStyle bodyText1 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 0.5);
  final TextStyle bodyText2 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25);
}
