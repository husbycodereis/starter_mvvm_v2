import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/appbar/custom_appbar.dart';
import 'package:movies_catalog/core/components/widgets/button/movie_details_button.dart';
import 'package:movies_catalog/core/components/widgets/list_view/movie_cast_list_view.dart';
import 'package:movies_catalog/core/constants/app/text_constants.dart';
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
    return CustomAppBar(
      automaticallyImplyLeading: true,
      centerTitle: false,
      text: widget.movie.title ?? TextConstants.movie_no_title,
      context: context,
    );
  }

  Widget buildBody(MovieDetailsViewModel model, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
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
              ],
            ),
          ),
          buildCastList(model)
        ],
      ),
    );
  }

  Widget buildMovieInfoRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildPoster(context), context.sizedBoxLowHorizontal, buildInfoColumn(context)],
    );
  }

  Row buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildFavoriteButton(context), buildWatchlistButton(context)],
    );
  }

  Text buildStoryHeader(BuildContext context) =>
      Text('Story', style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure));

  Text buildStoryOverview(BuildContext context) {
    return Text(widget.movie.overview ?? TextConstants.movie_no_story,
        textAlign: TextAlign.justify, style: context.textTheme.overline);
  }

  Text buildCastAndCrewHeader(BuildContext context) =>
      Text(TextConstants.movie_cast, style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure));

  Widget buildInfoColumn(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.movie.title ?? TextConstants.movie_no_title,
              style: context.textTheme.bodyText1!.copyWith(color: context.customColors.azure)),
          SizedBox(height: 20.h),
          buildRatingRow(context),
          SizedBox(height: 20.h),
          Text(widget.movie.releaseDate?.substring(0, 4) ?? TextConstants.movie_no_year,
              style: context.textTheme.overline),
          SizedBox(height: 20.h),
          Text(widget.movie.originalLanguage ?? TextConstants.movie_no_language, style: context.textTheme.overline),
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
          '${widget.movie.voteAverage ?? TextConstants.movie_no_score}${TextConstants.movie_imdb}',
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

  Widget buildFavoriteButton(BuildContext context) {
    return MovieDetailsButton(
        isFavorite: widget.movie.isFavorite,
        onPressed: () {
          setState(() {
            serviceLocator<FavoritesViewModel>().setFavorite(widget.movie);
          });
        },
        assetName: SVGImagePaths.instance!.heart,
        text: TextConstants.home_favorites);
  }

  Widget buildWatchlistButton(BuildContext context) {
    return MovieDetailsButton(
        onPressed: () {
          setState(() {
            serviceLocator<WatchListViewModel>().showWatchlistBottomSheet(widget.movie, context);
          });
        },
        assetName: SVGImagePaths.instance!.list,
        text: TextConstants.home_watchlist);
  }

  Widget buildCastList(MovieDetailsViewModel model) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: model.isScroll ? EdgeInsets.only(left: context.normalValue) : context.paddingNormalHorizontal,
          child: MovieCastListView(controller: model.castScrollController, movieCastList: model.movieCastList),
        );
      },
    );
  }

  void checkFavorite() {
    widget.movie.isFavorite = serviceLocator<FavoritesViewModel>().checkFavorite(widget.movie);
  }
}
