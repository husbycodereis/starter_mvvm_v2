import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(18.0),
            topRight:  Radius.circular(18.0),
          )),
      child: child,
    );
  }
}
