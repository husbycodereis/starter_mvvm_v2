import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/components/utility/throttle_helper.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:movies_catalog/view/search/service/ISearchService.dart';
import 'package:movies_catalog/view/search/service/search_service.dart';
part 'search_view_Model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store, BaseViewModel {
  late ISearchService searchService;
  late TextEditingController searchController;
  late ThrottleStringHelper throttleStingHelper;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  Future init() async {
    searchController = TextEditingController();
    throttleStingHelper = ThrottleStringHelper();
    searchService = SearchService(vexanaManager.networkManager);
    searchController.addListener(() {
      setSearchQueryAndSearch(searchController.text.trim());
    });
  }

  @observable
  bool loading = false;

  @observable
  String searchQuery = '';

  @observable
  List<MovieResultModel> searchResultList = ObservableList.of([]);

  @action
  void setSearchQueryAndSearch(String value) {
    throttleStingHelper.onDelayTouch(value, (text) {
      searchQuery = text!;
      searchWithQuery();
    });
  }

  @action
  Future searchWithQuery() async {
    if (searchQuery.length >= 3) {
      final result = await searchService.fetchSearchResults(context!, searchQuery);
      searchResultList = result!.results ?? [];
      print(searchResultList.map((e) => e.movieId));
    }
  }

  @action
  void setLoading() {
    loading = !loading;
  }

  void navigateToDetails(MovieResultModel movie) {
    navigation.navigateToPage(path: NavigationConstants.MOVIE_DETAILS_VIEV, data: movie);
  }

  void dispose() {
    searchController.clear();
  }
}
