import 'package:flutter/material.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/constants/app/text_constants.dart';
import 'package:movies_catalog/core/constants/enums/lottie_path_enum.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/extensions/widget_extensions.dart';
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
        onPageBuilder: (SettingsViewModel viewModel) => Scaffold(
              body: Padding(
                padding: context.paddingLowHorizontal,
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

  Widget buildLogoutButton(BuildContext context, SettingsViewModel viewModel) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            backgroundColor: context.customColors.azure,
            shape: const StadiumBorder(),
            padding: context.paddingLowVertical),
        onPressed: viewModel.logoutApp,
        icon: const Icon(Icons.exit_to_app),
        label: const Text(TextConstants.profile_logout));
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
            TextConstants.home_profile,
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
            Text(
              viewModel.userModel.name,
              style: context.textTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildProjectCore(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: 'Preferences', children: [
      ListTile(
        title: const Text(TextConstants.profile_theme),
        trailing: IconButton(
            onPressed: viewModel.changeAppTheme,
            icon: context.brightness == Brightness.light ? LottiePathEnum.SUN.toWidget : LottiePathEnum.MOON.toWidget),
        subtitle:
            Text(context.brightness == Brightness.light ? TextConstants.profile_light : TextConstants.profile_dark),
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
    return buildCardHeader(context, viewModel, title: TextConstants.profile_about, children: [
      ListTile(
        onTap: viewModel.navigateToContribution,
        leading: const Icon(Icons.favorite),
        title: const Text(TextConstants.profile_westerops),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      ),
    ]);
  }
}
