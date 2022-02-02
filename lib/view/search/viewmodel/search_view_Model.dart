import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:movies_catalog/view/search/service/ISearchService.dart';
import 'package:movies_catalog/view/search/service/search_service.dart';
part 'search_view_Model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store, BaseViewModel {
  late ISearchService searchService;
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  Future init() async{
    searchService = SearchService(vexanaManager.networkManager);
   await searchWithQuery();
  }

  @observable
  bool loading = false;

  @observable
  List<MovieResultModel>? searchResultList = ObservableList.of([]);

  @action
  Future searchWithQuery() async {
    setLoading();
    final result = await searchService.fetchSearchResults(context!, 'witcher');
    searchResultList = result!.results;
    setLoading();
  }

  @action
  void setLoading() {
    loading = !loading;
  }

 void navigateToDetails(MovieResultModel movie) {
    navigation.navigateToPage(path: NavigationConstants.MOVIE_DETAILS_VIEV, data: movie);
  }
}
