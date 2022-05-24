// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeViewModel on _ThemeViewModel, Store {
  final _$themeModeAtom = Atom(name: '_ThemeViewModel.themeMode');

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  final _$themeAtom = Atom(name: '_ThemeViewModel.theme');

  @override
  String get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(String value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ThemeViewModel.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_ThemeViewModelActionController =
      ActionController(name: '_ThemeViewModel');

  @override
  ThemeMode setThemeMode(String theme) {
    final _$actionInfo = _$_ThemeViewModelActionController.startAction(
        name: '_ThemeViewModel.setThemeMode');
    try {
      return super.setThemeMode(theme);
    } finally {
      _$_ThemeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
theme: ${theme}
    ''';
  }
}
