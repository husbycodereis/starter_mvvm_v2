import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/core/init/di/locator.dart';
import 'package:movies_catalog/view/authentication/login/view_model/login_view_model.dart';
import 'package:movies_catalog/view/authentication/splash/service/ISplashService.dart';


part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late ISplashService splashService;
  late LoginViewModel loginViewModel;
    late BuildContext buildContext; 
  _SplashViewModelBase(this.splashService);

  @override
  void setContext(BuildContext context) => buildContext = context;
  @override
  void init() {
    startAnimationOnView();
    loginViewModel = locator<LoginViewModel>();
    navigateToScreens();
  }

  @observable
  bool isFirstInit = true;

  Future<void> startAnimationOnView() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _changeFirstInit();
  }

  Future<void> navigateToScreens() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await navigation.navigateToPageClear(
        path: loginViewModel.isLoggedIn ? NavigationConstants.HOME : NavigationConstants.LOGIN_VIEW);
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}
