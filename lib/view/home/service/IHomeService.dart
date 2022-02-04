import 'package:flutter/material.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:vexana/vexana.dart';

abstract class IHomeService {
  final INetworkManager manager;

  IHomeService({required this.manager});

  Future<SearchResultModel?> fetchTopMovies(BuildContext context, String movieQuery);
}
