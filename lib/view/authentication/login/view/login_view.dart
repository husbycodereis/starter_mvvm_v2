import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_path_svg.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (LoginViewModel viewModel) =>
            DefaultTabController(length: 2, child: buildBody(context, viewModel)));
  }

  Scaffold buildBody(BuildContext context, LoginViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldState,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: context.paddingNormalAll,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  context.sizedBoxCustomVertical(0.08),
                  SvgPicture.asset(
                    SVGImagePaths.instance!.cameraSVG,
                    width: context.dynamicWidth(0.25),
                  ),
                  context.sizedBoxCustomVertical(0.028),
                  Text('The Movie Manager', style: context.textTheme.headline1),
                  context.sizedBoxCustomVertical(0.04),
                  Text('Login with Email', style: context.textTheme.bodyText1),
                  buildForm(viewModel, context)
                ],
              ),
            ),
          ),
        ),
      );

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTextFormFieldEmail(context, viewModel),
          context.sizedBoxNormalVertical,
          buildTextFormFieldPassword(context, viewModel),
          context.sizedBoxNormalVertical,
          buildLoginButton(context, viewModel),
          // context.sizedBoxNormalVertical,
          SizedBox(
            height: 32,
          ),
          buildForgotPassword(),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmail,
      decoration:
          InputDecoration(labelText: 'email (eve.holt@reqres.in)', icon: buildContainerIconField(context, Icons.email)),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) => Observer(builder: (_) {
        return TextFormField(
          controller: viewModel.passwordController,
          validator: (value) => value!.isNotEmpty ? null : 'enter password',
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: () => viewModel.isLockStateChange(),
                child: Icon(viewModel.isLockOpen ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
              ),
              labelText: 'password (cityslicka)',
              icon: buildContainerIconField(context, Icons.lock)),
        );
      });

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
        padding: context.paddingLowAll,
        color: context.colors.secondary,
        child: Icon(
          icon,
          color: context.customColors.white,
        ));
  }

  Widget buildForgotPassword() => const Align(child: Text('Forgot Password?'));

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        style: ElevatedButton.styleFrom(
          primary: context.colors.secondary,
          shape: const StadiumBorder(),
          padding: context.paddingMediumAll,
        ),
        child: Text(
          'Login',
          style: context.textTheme.bodyText1,
        ),
      );
    });
  }
}
