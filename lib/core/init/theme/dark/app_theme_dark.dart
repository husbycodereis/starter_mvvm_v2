import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme.dart';
import 'theme_interface_dark.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark.init();
  }

  AppThemeDark.init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: colorThemeDark!.darkBlue,
        colorScheme: colorThemeDark!.colorScheme,
        backgroundColor: colorThemeDark!.darkBlue,
        scaffoldBackgroundColor: colorThemeDark!.darkBlue,
        brightness: Brightness.dark,
        textTheme: textTheme(),
      );

  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeDark!.headline1,
        headline2: textThemeDark!.headline2,
        headline3: textThemeDark!.headline3,
        headline4: textThemeDark!.headline4,
        overline: textThemeDark!.overline,
        bodyText1: textThemeDark!.bodyText1,
        bodyText2: textThemeDark!.bodyText2);
  }
}
