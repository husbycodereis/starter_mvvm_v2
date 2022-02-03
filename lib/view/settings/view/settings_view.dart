import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/constants/enums/lottie_path_enum.dart';
import 'package:movies_catalog/core/init/provider/notifiers/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/extensions/widget_extensions.dart';

import '../../../core/init/theme/light/app_theme_light.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        
        onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomScrollView(
                  slivers: [
                    buildSliverAppBar(context),
                    buildCardUser(context, viewModel).toSliver,
                    context.sizedBoxLowVertical.toSliver,
                    buildProjectCore(context, viewModel).toSliver,
                    context.sizedBoxLowVertical.toSliver,
                    buildCardAbout(context, viewModel).toSliver,
                    context.sizedBoxMediumVertical.toSliver,
                    buildLogoutButton(context, viewModel).toSliver,
                  ],
                ),
              ),
            ));
  }

  Padding buildLogoutButton(BuildContext context, SettingsViewModel viewModel) {
    return Padding(
        padding: context.paddingLowAll * 0.4,
        child: TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: context.customColors.white,
                shape: const StadiumBorder(),
                padding: context.paddingNormalVertical),
            onPressed: viewModel.logoutApp,
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Logout')));
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      elevation: 0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text(
            'Settings',
            style: context.textTheme.headline5,
          )),
    );
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: SizedBox(
        height: context.dynamicHeight(0.1),
        child: Row(
          children: [
            Padding(
              padding: context.paddingLowAll,
              child: CircleAvatar(
                child: Image.network(''.customProfileImage),
              ),
            ),
            SizedBox(
              width: context.lowValue,
            ),
            Text(viewModel.userModel.name)
          ],
        ),
      ),
    );
  }

  Widget buildProjectCore(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: 'Tools', children: [
      ListTile(
        title: Text('App Theme'),
        trailing: IconButton(
            onPressed: viewModel.changeAppTheme,
            icon: context.watch<ThemeNotifier>().currentTheme == AppThemeLight.instance.theme
                ? LottiePathEnum.SUN.toWidget
                : LottiePathEnum.MOON.toWidget),
        subtitle: Text(context.watch<ThemeNotifier>().currentTheme == AppThemeLight.instance.theme ? 'Light' : 'Dark'),
      ),
    ]);
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel,
      {required String title, required List<Widget> children}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLowAll,
            child: Text(
              title,
              style: context.textTheme.headline5,
            ),
          ),
          const Divider(),
          ...children
        ],
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: 'About', children: [
      ListTile(
        onTap: viewModel.navigateToContribution,
        leading: const Icon(Icons.favorite),
        title: Text('WesterOps Home'),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      ),
    ]);
  }

  //alternative method for creating a sliver
  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      body: const Text('hello'),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar(context)];
      },
    );
  }
}
