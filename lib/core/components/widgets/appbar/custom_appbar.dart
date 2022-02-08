import 'package:flutter/material.dart';

import 'package:movies_catalog/core/extensions/context_extensions.dart';

class CustomAppBar extends AppBar {
  final String? text;
  final BuildContext? context;
  @override
  final bool? centerTitle;
  @override
  final bool automaticallyImplyLeading;
  CustomAppBar({
    this.text,
    this.context,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
    Key? key,
  }) : super(
            key: key,
            elevation: 1,
            centerTitle: centerTitle,
            automaticallyImplyLeading: automaticallyImplyLeading,
            title: Text(
              text ?? '',
              style: context!.textTheme.headline4!.copyWith(color: context.customColors.azure),
            ));
}
