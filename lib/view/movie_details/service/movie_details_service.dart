import 'package:flutter/material.dart';
import 'package:movies_catalog/core/components/utility/service_helper.dart';
import 'package:movies_catalog/core/constants/app/app_constants.dart';
import 'package:movies_catalog/core/constants/enums/network_route_enum.dart';
import 'package:movies_catalog/view/movie_details/model/movie_cast_result.dart';
import 'package:movies_catalog/view/movie_details/service/IMovieDetailsService.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:vexana/vexana.dart';

class MovieDetailsService extends IMovieDetailsService with ServiceHelper {
  MovieDetailsService(INetworkManager manager) : super(manager: manager);
  @override
  Future<MovieCastResponse?> fetchMovieCast(BuildContext context, int movieId) async {
    final response = await manager.send<MovieCastResponse, MovieCastResponse>(
        '${NetWorkRoutes.MOVIE_DETAILS.value}$movieId/${NetWorkRoutes.CREDITS.value}',
        method: RequestType.GET,
        parseModel: MovieCastResponse(),
        queryParameters: {
          'api_key': ApplicationConstants.movieApi,
          'language': 'en-US',
        });
    showMessage(response.error, context);
    if (response.data is MovieResultModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
