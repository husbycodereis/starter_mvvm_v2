import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/constants/image/image_constants.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/network/vexana_manager.dart';
import 'package:movies_catalog/view/authentication/splash/service/ISplashService.dart';
import 'package:movies_catalog/view/authentication/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(SplashService(VexanaManager.instance.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: ( SplashViewModel viewModel) => Scaffold(
        backgroundColor: context.customColors.white,
        body: SafeArea(
            child: Stack(
          children: [
            buildAnimatedTextAndCircularProgressBar(context, viewModel),
            // buildAnimatedIcon(context, viewModel),
          ],
        )),
      ),
    );
  }

  Center buildAnimatedTextAndCircularProgressBar(BuildContext context, SplashViewModel viewModel) {
    return Center(
      child: Observer(builder: (_) {
        return AnimatedOpacity(
          duration: context.normalDuration,
          opacity: viewModel.isFirstInit ? 0 : 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageConstants.instance.projectIcon,
                width: context.dynamicWidth(0.5),
              )
            ],
          ),
        );
      }),
    );
  }
}
