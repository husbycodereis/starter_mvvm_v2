import 'package:json_annotation/json_annotation.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/search/view/subview/movie_details_view.dart';
part 'watchlist_model.g.dart';

@JsonSerializable()
class WatchListModel extends LocalDatabaseModel {
  @override
  int? localId;
  String? name;
  List<MovieResultModel>? movies;
  WatchListModel({
    this.localId,
    this.name,
    this.movies,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) => _$WatchListModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WatchListModelToJson(this);
}
