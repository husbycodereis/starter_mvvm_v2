import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/button/normal_button.dart';
import 'package:movies_catalog/core/constants/image/image_path_svg.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';
import 'package:movies_catalog/view/movie_details/view_model/movie_details_view_model.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieResultModel movie;

  const MovieDetailsView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MovieDetailsViewModel>(
      viewModel: MovieDetailsViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        checkFavorite();
        await model.fetchMovieCastList(widget.movie);
      },
      onPageBuilder: (MovieDetailsViewModel model) =>
          Scaffold(appBar: buildAppBar(context), body: buildBody(model, context)),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 1,
      title: Text(widget.movie.title ?? 'No Title Found',
          style: context.textTheme.headline4!.copyWith(color: context.customColors.azure)),
    );
  }

  Padding buildBody(MovieDetailsViewModel model, BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.sizedBoxLowVertical,
            buildMovieInfoRow(context),
            context.sizedBoxLowVertical,
            buildButtonsRow(context),
            context.sizedBoxNormalVertical,
            buildStoryHeader(context),
            context.sizedBoxLowVertical,
            buildStoryOverview(context),
            context.sizedBoxNormalVertical,
            buildCastAndCrewHeader(context),
            context.sizedBoxLowVertical,
            buildCastList(model)
          ],
        ),
      ),
    );
  }

  Text buildCastAndCrewHeader(BuildContext context) =>
      Text('Cast and Crew', style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure));

  Text buildStoryOverview(BuildContext context) {
    return Text(widget.movie.overview ?? 'No Story available',
        textAlign: TextAlign.justify, style: context.textTheme.overline);
  }

  Text buildStoryHeader(BuildContext context) =>
      Text('Story', style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure));

  Row buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildFavoriteButton(context), buildWatchlistButton(context)],
    );
  }

  Widget buildMovieInfoRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildPoster(context), context.sizedBoxLowHorizontal, buildInfoColumn(context)],
    );
  }

  Widget buildInfoColumn(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.movie.title ?? 'No title found',
              style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure)),
          SizedBox(height: 20.h),
          buildRatingRow(context),
          SizedBox(height: 20.h),
          Text(widget.movie.releaseDate?.substring(0, 4) ?? 'No year found', style: context.textTheme.overline),
          SizedBox(height: 20.h),
          Text(widget.movie.originalLanguage ?? 'No language available', style: context.textTheme.overline),
          SizedBox(height: 20.h),
        ],
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
          '${widget.movie.voteAverage ?? 'No score found'}' + ' | IMDB',
          style: context.textTheme.overline,
        )
      ],
    );
  }

  ClipRRect buildPoster(BuildContext context) {
    return ClipRRect(
      borderRadius: context.bordernormalRadius,
      child: Image.network(
        widget.movie.fullImageUrl,
        fit: BoxFit.cover,
        height: 272.h,
        width: 168.w,
      ),
    );
  }

  ElevatedButton buildFavoriteButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            serviceLocator<FavoritesViewModel>().setFavorite(widget.movie);
          });
        },
        style: ElevatedButton.styleFrom(
          primary: context.brightness == Brightness.dark
              ? widget.movie.isFavorite!
                  ? context.customColors.whiteShade
                  : context.customColors.darkBlue
              : widget.movie.isFavorite!
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
            children: [
              SvgPicture.asset(
                SVGImagePaths.instance!.heart,
                color: context.customColors.azure,
                width: 21.w,
              ),
              context.sizedBoxNormalHorizontal,
              const Text('Favorite')
            ],
          ),
        ));
  }

  ElevatedButton buildWatchlistButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            serviceLocator<WatchListViewModel>().showWatchlistBottomSheet(widget.movie, context);
          });
        },
        style: ElevatedButton.styleFrom(
          primary: context.brightness == Brightness.dark ? context.customColors.darkBlue : context.customColors.azure,
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
            children: [
              SvgPicture.asset(
                SVGImagePaths.instance!.list,
                color: context.customColors.azure,
                width: 21.w,
              ),
              context.sizedBoxNormalHorizontal,
              const Text('Watchlist')
            ],
          ),
        ));
  }

  Widget buildCastList(MovieDetailsViewModel model) {
    return Observer(
      builder: (_) {
        return Container(
          height: 300,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: model.movieCastList.length,
              separatorBuilder: (context, index) => context.sizedBoxLowHorizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: context.bordernormalRadius,
                      child: Image.network(
                        model.movieCastList[index].fullImageUrl,
                        fit: BoxFit.cover,
                        height: 172.h,
                        width: 132.w,
                        //width: 168.w,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(model.movieCastList[index].name ?? 'No name found', style: context.textTheme.bodyText2)
                  ],
                );
              }),
        );
      },
    );
  }

  void checkFavorite() {
    widget.movie.isFavorite = serviceLocator<FavoritesViewModel>().checkFavorite(widget.movie);
  }
}
