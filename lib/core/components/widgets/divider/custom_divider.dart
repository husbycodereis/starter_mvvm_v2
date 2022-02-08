import 'package:flutter/material.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2,
      color: context.customColors.darkGrey,
    );
  }
}
