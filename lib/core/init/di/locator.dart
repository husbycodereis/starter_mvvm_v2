import 'package:get_it/get_it.dart';
import 'package:movies_catalog/core/init/theme/view_model/theme_view_model.dart';
import 'package:movies_catalog/view/authentication/login/view_model/login_view_model.dart';


final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() => ThemeViewModel());
  locator.registerLazySingleton(() => LoginViewModel());
}
