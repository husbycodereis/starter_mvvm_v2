import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  const String encodedQuery = 'witcher';
  const String movieApi = ApplicationConstants.movieApi;
  setUp(() {
    networkManager =
        NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://api.themoviedb.org/3'));
  });
  test('Search Success', () async {
    final data = await networkManager.send<SearchResultModel, SearchResultModel>(
      '/search/multi?api_key=$movieApi&query=$encodedQuery&language=en-US&page=1&include_adult=false',
      method: RequestType.GET,
      parseModel: SearchResultModel(),
    );

    log('total results are: ${data.data!.results!.first.overview}');
    expect(data.data!.results, isNotEmpty);
  });
}
