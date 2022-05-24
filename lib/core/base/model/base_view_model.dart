import 'package:flutter/material.dart';

import '../../init/cache/shared_prefs_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {


  VexanaManager vexanaManager = VexanaManager.instance;
  SharedPrefsManager sharedPrefManager = SharedPrefsManager.instance;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
