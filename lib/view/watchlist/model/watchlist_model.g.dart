// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchListModel _$WatchListModelFromJson(Map<String, dynamic> json) {
  return WatchListModel(
    localId: json['localId'] as int?,
    name: json['name'] as String?,
    movies: (json['movies'] as List<dynamic>?)
        ?.map((e) => MovieResultModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WatchListModelToJson(WatchListModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'name': instance.name,
      'movies': instance.movies,
    };
