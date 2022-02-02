import 'package:json_annotation/json_annotation.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:vexana/vexana.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResultModel extends INetworkModel<SearchResultModel> {
  int? page;
  List<MovieResultModel>? results;
  @JsonKey(name: 'total_results')
  int? totalResults;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  SearchResultModel({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  @override
  SearchResultModel fromJson(Map<String, dynamic> json) {
    return _$SearchResultModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}
