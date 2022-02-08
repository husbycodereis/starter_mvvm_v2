import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/constants/app/text_constants.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

import 'package:movies_catalog/view/search/model/movie_result.dart';

class MovieListCard extends StatelessWidget {
  final MovieResultModel movie;
  const MovieListCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Row buildBody(BuildContext context) {
    return Row(
      children: [
        buildPoster(context),
        context.sizedBoxMediumHorizontal,
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(movie.title ?? TextConstants.movie_no_title,
                style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure)),
            SizedBox(height: 20.h),
            buildRatingRow(context),
            SizedBox(height: 20.h),
            Text(movie.releaseDate?.substring(0, 4) ?? 'No year found', style: context.textTheme.overline),
          ]),
        )
      ],
    );
  }

  ClipRRect buildPoster(BuildContext context) {
    return ClipRRect(
      borderRadius: context.bordernormalRadius,
      child: Image.network(
        movie.fullImageUrl,
        fit: BoxFit.cover,
        height: 150.h,
        width: 92.w,
      ),
    );
  }

  Row buildRatingRow(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        context.sizedBoxLowHorizontal,
        Text(
          '${movie.voteAverage ?? 'No score found'}' + ' | IMDB',
          style: context.textTheme.overline,
        )
      ],
    );
  }
}
