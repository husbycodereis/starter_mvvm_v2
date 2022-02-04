import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/core/constants/enums/network_route_enum.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;

  setUp(() {
    networkManager =
        NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://api.themoviedb.org/3'));
  });
  test('Top Movies Fetch Success', () async {
    final data = await networkManager.send<SearchResultModel, SearchResultModel>(NetWorkRoutes.TOP_MOVIES.value,
        method: RequestType.GET,
        parseModel: SearchResultModel(),
        queryParameters: {
          'api_key': ApplicationConstants.movieApi,
          'sort_by': 'vote_average.desc',
          'include_adult': false,
          'include_video': false,
          'vote_count.gte': 2000,
          'page': 1
        });

    debugPrint('total results are: ${data.data!.results!.length}');
    expect(data.data!.results, isNotEmpty);
  });
}
