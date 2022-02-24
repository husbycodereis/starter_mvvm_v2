// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCastResponse _$MovieCastResponseFromJson(Map<String, dynamic> json) {
  return MovieCastResponse(
    id: json['id'] as int?,
    castList: (json['cast'] as List<dynamic>?)
        ?.map((e) => MovieCast.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieCastResponseToJson(MovieCastResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.castList,
    };
