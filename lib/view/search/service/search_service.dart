import 'package:flutter/material.dart';
import 'package:movies_catalog/core/components/utility/service_helper.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/core/constants/enums/network_route_enum.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:movies_catalog/view/search/service/ISearchService.dart';
import 'package:vexana/vexana.dart';

class SearchService extends ISearchService with ServiceHelper {
  SearchService(INetworkManager manager) : super(manager: manager);
  @override
  Future<SearchResultModel?> fetchSearchResults(BuildContext context, String movieQuery) async {
    final response = await manager.send<SearchResultModel, SearchResultModel>(
      NetWorkRoutes.SEARCH.value,
      method: RequestType.GET,
      parseModel: SearchResultModel(),
      queryParameters: {
          'api_key': ApplicationConstants.movieApi,
          'query': movieQuery,
          'language': 'en-US',
          'page': '1',
          'include_adult': false
      }
    );
    showMessage(response.error, context);
    if (response.data is SearchResultModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
