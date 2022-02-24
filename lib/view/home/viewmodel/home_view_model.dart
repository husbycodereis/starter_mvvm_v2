import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/view/home/service/IHomeService.dart';
import 'package:movies_catalog/view/home/service/home_service.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late IHomeService homeService;
  late ScrollController movieScrollController;
  
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    homeService = HomeService(vexanaManager.networkManager);
    movieScrollController = ScrollController();
    listenToMovieScrollController();
    fetchTopMovies();
  }

  void listenToMovieScrollController() {
     movieScrollController.addListener(() {
      if (movieScrollController.position.pixels == movieScrollController.position.maxScrollExtent) {
        moviePageNumber++;
        fetchTopMovies();
      }
    });
  }

  @observable
  int moviePageNumber = 1;

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
    final result = await homeService.fetchTopMovies(context!, moviePageNumber);
    topMoviesList.addAll(result!.results ?? []);
  }

   void navigateToDetails(MovieResultModel movie) {
    navigation.navigateToPage(path: NavigationConstants.MOVIE_DETAILS_VIEV, data: movie);
  }

  void dispose() {
    movieScrollController.dispose();
  }
}
