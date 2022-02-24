
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/core/constants/enums/network_route_enum.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  const String movieQuery = 'lord of the rings';
  setUp(() {
    networkManager =
        NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://api.themoviedb.org/3'));
  });
  test('Search Success', () async {
    final data = await networkManager.send<SearchResultModel, SearchResultModel>(
        NetWorkRoutes.SEARCH.value,
        method: RequestType.GET,
        parseModel: SearchResultModel(),
        queryParameters: {
          'api_key': ApplicationConstants.movieApi,
          'query': movieQuery,
          'language': 'en-US',
          'page': '1',
          'include_adult': false
        });

    debugPrint('total results are: ${data.data!.results!.length}');
    expect(data.data!.results, isNotEmpty);
  });
}
