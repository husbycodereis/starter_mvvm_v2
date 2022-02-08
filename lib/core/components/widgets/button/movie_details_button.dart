import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:movies_catalog/core/extensions/context_extensions.dart';

class MovieDetailsButton extends StatelessWidget {
  final void Function() onPressed;
  final String assetName;
  final String text;
  final bool? isFavorite;
  const MovieDetailsButton({
    Key? key,
    required this.onPressed,
    required this.assetName,
    required this.text,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: context.brightness == Brightness.dark
              ? isFavorite!
                  ? context.customColors.whiteShade
                  : context.customColors.darkBlue
              : isFavorite!
                  ? context.customColors.darkBlue
                  : context.customColors.whiteShade,
          shape: RoundedRectangleBorder(
            borderRadius: context.borderhighadius,
            side: BorderSide(
              color: context.customColors.azure,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                assetName,
                color: context.customColors.azure,
                width: 21.w,
              ),
              context.sizedBoxNormalHorizontal,
              Text(text)
            ],
          ),
        ));
  }
}

//  ? widget.movie.isFavorite!
//                   ? context.customColors.whiteShade
//                   : context.customColors.darkBlue
//               : widget.movie.isFavorite!
//                   ? context.customColors.darkBlue
//                   : context.customColors.whiteShade,