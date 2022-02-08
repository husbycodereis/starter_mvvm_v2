import 'package:flutter/material.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
class CustomDivider extends Divider {
  final BuildContext? context;
  CustomDivider({
    this.context,
    Key? key,
  }) : super(key: key, thickness: 2, color: context!.customColors.darkGrey);
}
