import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/core/constants/enums/network_route_enum.dart';
import 'package:movies_catalog/view/movie_details/model/movie_cast_result.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  const int movieId = 100;
  setUp(() {
    networkManager =
        NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://api.themoviedb.org/3'));
  });
  test('Fetch Cast Success', () async {
    final data = await networkManager.send<MovieCastResponse, MovieCastResponse>(
        '${NetWorkRoutes.MOVIE_DETAILS.value}$movieId/${NetWorkRoutes.CREDITS.value}',
        method: RequestType.GET,
        parseModel: MovieCastResponse(),
        queryParameters: {
          'api_key': ApplicationConstants.movieApi,
          'language': 'en-US',
        });
    debugPrint('total cast length is: ${data.data!.castList!.length}');
    expect(data.data!.castList, isNotEmpty);
  });
}
