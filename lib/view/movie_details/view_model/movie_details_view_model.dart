import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/view/movie_details/model/movie_cast.dart';
import 'package:movies_catalog/view/movie_details/service/IMovieDetailsService.dart';
import 'package:movies_catalog/view/movie_details/service/movie_details_service.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
part 'movie_details_view_model.g.dart';

class MovieDetailsViewModel = _MovieDetailsViewModelBase with _$MovieDetailsViewModel;

abstract class _MovieDetailsViewModelBase with Store, BaseViewModel {
  late IMovieDetailsService movieDetailsService;
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    movieDetailsService = MovieDetailsService(vexanaManager.networkManager);
  }

  @observable
  List<MovieCast> movieCastList = ObservableList.of([]);

  @observable
  bool loading = false;

  @action
  void setLoading() {
    loading = !loading;
  }

  @action
  Future fetchMovieCastList(MovieResultModel movie) async {
    final result = await movieDetailsService.fetchMovieCast(context!, movie.movieId!);
    movieCastList = result!.castList ?? [];
  }
}