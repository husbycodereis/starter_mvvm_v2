import 'package:flutter/material.dart';

import 'package:movies_catalog/core/extensions/context_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Widget? suffix;
  final bool? obscureText;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.validator,
    this.labelText,
    this.suffix,
    this.obscureText,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: obscureText ?? false,
      style: context.textTheme.bodyText1!.copyWith(color: context.customColors.darkGrey),
      decoration: InputDecoration(
        hintText: labelText ?? '',
        hintStyle: context.textTheme.bodyText1!.copyWith(color: context.customColors.darkGrey),
        border: OutlineInputBorder(borderRadius: context.borderlowRadius),
        filled: true,
        isDense: true,
        fillColor: context.customColors.whiteShade,
        suffix: suffix,
      ),
    );
  }
}
