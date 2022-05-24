import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late BuildContext buildContext;
  late ILoginService loginService;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void setContext(BuildContext context) {
   buildContext = context;
  }

  @override
  void init() {
    loginService = LoginService(vexanaManager.loginManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;
  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(
          LoginModel(email: emailController.text, password: passwordController.text), buildContext);
      if (response != null) {
        await sharedPrefManager.setStringValue(SharedPrefKeys.TOKEN, response.token!);
        await buildContext.showSnackBar('Login Successful!');
        await navigation.navigateToPage(
          path: NavigationConstants.HOME,
        );
      }
    }
    isLoadingChange();
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
