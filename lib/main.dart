import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_catalog/core/init/provider/notifiers/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'core/init/cache/shared_prefs_manager.dart';
import 'core/init/navigation/navigation_routes.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/provider/provider_list.dart';

Future main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
}
