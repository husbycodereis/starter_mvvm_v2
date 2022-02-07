import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/view/home/service/IHomeService.dart';
import 'package:movies_catalog/view/home/service/home_service.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late IHomeService homeService;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    homeService = HomeService(vexanaManager.networkManager);
    fetchTopMovies();
  }

  @observable
  bool loading = false;

  @observable
  List<MovieResultModel> topMoviesList = ObservableList.of([]);

  @action
  void setLoading() {
    loading = !loading;
  }

  @action
  Future fetchTopMovies() async {
    setLoading();
    final result = await homeService.fetchTopMovies(context!, 1);
    topMoviesList = result!.results ?? [];
    setLoading();
  }
}
