import 'package:flutter/material.dart';
import 'package:movies_catalog/view/movie_details/model/movie_cast_result.dart';
import 'package:vexana/vexana.dart';

abstract class IMovieDetailsService {
  final INetworkManager manager;

  IMovieDetailsService({required this.manager});

  Future<MovieCastResponse?> fetchMovieCast(BuildContext context, int movieId);
}