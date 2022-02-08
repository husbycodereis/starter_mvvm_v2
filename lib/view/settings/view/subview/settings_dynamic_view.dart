import 'package:flutter/material.dart';
import 'package:movies_catalog/core/components/widgets/appbar/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../model/settings_dynamic_model.dart';

class SettingsDynamicView extends StatelessWidget {
  final SettingsDynamicModel model;
  const SettingsDynamicView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        text: model.title,
      ),
      body: WebView(
        initialUrl: model.url ?? ApplicationConstants.APP_WEB_SITE,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
