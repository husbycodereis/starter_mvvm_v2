import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

import 'package:movies_catalog/view/movie_details/model/movie_cast.dart';

class MovieCastListView extends StatelessWidget {
  final List<MovieCast> movieCastList;
  const MovieCastListView({
    Key? key,
    required this.movieCastList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movieCastList.length,
          separatorBuilder: (context, index) => context.sizedBoxLowHorizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: context.bordernormalRadius,
                  child: Image.network(
                    movieCastList[index].fullImageUrl,
                    fit: BoxFit.cover,
                    height: 172.h,
                    width: 132.w,
                    //width: 168.w,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(movieCastList[index].name ?? 'No name found', style: context.textTheme.bodyText2)
              ],
            );
          }),
    );
  }
}
