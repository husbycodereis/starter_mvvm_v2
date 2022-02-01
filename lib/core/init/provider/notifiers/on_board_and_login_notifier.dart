import 'package:flutter/material.dart';

import '../../../constants/enums/locale_keys_enum.dart';
import '../../cache/shared_prefs_manager.dart';

class LoginNotifier extends ChangeNotifier {
  final String _isLoggedIn = SharedPrefsManager.instance.getStringValue(SharedPrefKeys.TOKEN);
  bool get isLoggedIn => _isLoggedIn.isNotEmpty;
}
