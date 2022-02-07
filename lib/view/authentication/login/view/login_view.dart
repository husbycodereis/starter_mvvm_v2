import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/components/widgets/text_form_field/custom_text_form_field.dart';

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
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: context.height),
            child: Padding(
              padding: context.paddingNormalAll,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120.h),
                  buildImage(context),
                  context.sizedBoxNormalVertical,
                  Text('The Movie Manager', style: context.textTheme.headline1),
                  SizedBox(height: 50.h),
                  Text('Login with Email', style: context.textTheme.bodyText1),
                  context.sizedBoxNormalVertical,
                  buildForm(viewModel, context),
                  context.sizedBoxNormalVertical,
                  buildForgotPassword(context),
                  const Spacer(),
                  buildBottomText(context)
                ],
              ),
            ),
          ),
        ),
      );

  Text buildBottomText(BuildContext context) {
    return Text(
      'This product uses the TMDb API but is not endorsed or certified by TMDb.',
      textAlign: TextAlign.center,
      style: context.textTheme.bodyText2,
    );
  }

  SvgPicture buildImage(BuildContext context) {
    return SvgPicture.asset(
      SVGImagePaths.instance!.cameraSVG,
      width: 107.w,
      color: context.brightness == Brightness.dark ? context.customColors.white : context.customColors.darkBlue,
    );
  }

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
        ],
      ),
    );
  }

  Widget buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return CustomTextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmail,
      labelText: 'Email (eve.holt@reqres.in)',
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) => Observer(builder: (_) {
        return CustomTextFormField(
            controller: viewModel.passwordController,
            validator: (value) => value!.isNotEmpty ? null : 'enter password',
            obscureText: viewModel.isLockOpen,
            labelText: 'password (cityslicka)',
            suffix: GestureDetector(
              onTap: () => viewModel.isLockStateChange(),
              child: Icon(
                viewModel.isLockOpen ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                color: context.customColors.darkGrey,
              ),
            ));
      });

  Widget buildForgotPassword(BuildContext context) {
    return Align(child: Text('Forgot Password?', style: context.textTheme.bodyText1));
  }

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
          padding: EdgeInsets.all(16.h),
        ),
        child: Text(
          'Login',
          style: context.textTheme.bodyText1,
        ),
      );
    });
  }
}
