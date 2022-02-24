import 'package:flutter/material.dart';
import 'package:movies_catalog/view/search/model/search_result.dart';
import 'package:vexana/vexana.dart';

abstract class ISearchService {
  final INetworkManager manager;

  ISearchService({required this.manager});

  Future<SearchResultModel?> fetchSearchResults(BuildContext context, String movieQuery);
}