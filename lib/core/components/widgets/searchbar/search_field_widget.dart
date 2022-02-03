import 'package:flutter/material.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool isAbleToCancel;
  final VoidCallback? onPressedCancel;

  const SearchFieldWidget({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.isAbleToCancel = false,
    this.onPressedCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [buildSearchBox(context), context.sizedBoxLowVertical, if (isAbleToCancel) buildCancelButton()],
    );
  }

  Widget buildSearchBox(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: context.customColors.grey,
              width: 0.5,
            ),
            color: context.customColors.white,
            borderRadius: context.borderlowRadius),
        child: Row(children: [
          context.sizedBoxLowHorizontal,
          const Icon(Icons.search),
          context.sizedBoxLowHorizontal,
          Expanded(
              child: TextFormField(
            style: context.textTheme.bodyText1,
            decoration: InputDecoration(
              hintStyle: context.textTheme.bodyText2,
              border: InputBorder.none,
              hintText: hintText,
            ),
            controller: controller,
            focusNode: focusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
          )),
        ]),
      ),
    );
  }

  IconButton buildCancelButton() {
    return IconButton(onPressed: onPressedCancel, icon: Icon(Icons.cancel));
  }
}
