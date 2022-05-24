import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/init/cache/local_database.dart';
import 'package:movies_catalog/core/init/theme/dark/app_theme_dark.dart';

import 'core/init/cache/shared_prefs_manager.dart';
import 'core/init/di/locator.dart' as di;
import 'core/init/navigation/navigation_routes.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/light/app_theme_light.dart';
import 'core/init/theme/view_model/theme_view_model.dart';

Future main() async {
  await _init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, widget) => Observer(
              builder: (_) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppThemeLight.instance.theme,
                  darkTheme: AppThemeDark.instance.theme,
                  themeMode: di.locator<ThemeViewModel>().themeMode,
                  navigatorKey: NavigationService.instance.navigatorKey,
                  onGenerateRoute: NavigationRoute.instance.generateRoute,
                );
              },
            ));
  }
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsManager.preferencesInit();
  await LocalDatabase.instance.database;
  await di.init();
}
