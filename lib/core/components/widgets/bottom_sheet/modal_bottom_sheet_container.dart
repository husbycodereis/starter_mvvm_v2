import 'package:flutter/material.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

class ModalBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const ModalBottomSheetContainer({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: context.paddingNormalAll,
      child: child,
    );
  }
}
