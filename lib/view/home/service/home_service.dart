import 'package:flutter/material.dart';
import 'package:movies_catalog/core/components/utility/service_helper.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/core/constants/enums/network_route_enum.dart';
import 'package:movies_catalog/view/home/service/IHomeService.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:vexana/vexana.dart';

class HomeService extends IHomeService with ServiceHelper {
  HomeService(INetworkManager manager) : super(manager: manager);
  @override
  Future<SearchResultModel?> fetchTopMovies(BuildContext context, int page) async {
    final response = await manager.send<SearchResultModel, SearchResultModel>(NetWorkRoutes.TOP_MOVIES.value,
        method: RequestType.GET,
        parseModel: SearchResultModel(),
        queryParameters: {
          'api_key': ApplicationConstants.movieApi,
          'sort_by': 'vote_average.desc',
          'include_adult': false,
          'include_video': false,
          'vote_count.gte': 5000,
          'page': page
        });
    showMessage(response.error, context);
    if (response.data is SearchResultModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
