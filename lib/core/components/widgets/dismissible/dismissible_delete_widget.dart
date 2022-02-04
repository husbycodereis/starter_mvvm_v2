import 'package:flutter/material.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

class DismissibleDeleteWidget extends StatelessWidget {
  final String keyString;
  final void Function(DismissDirection)? onDismissed;
  final Widget child;
  const DismissibleDeleteWidget({
    Key? key,
    required this.child,
    required this.keyString,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(keyString),
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      background: Container(
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: context.paddingLowAll,
              child: Icon(
                Icons.delete,
                color: context.customColors.white,
              ),
            )),
      ),
      child: child,
    );
  }
}
