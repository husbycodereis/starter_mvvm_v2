// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCast _$MovieCastFromJson(Map<String, dynamic> json) {
  return MovieCast(
    gender: json['gender'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    profilePath: json['profile_path'] as String?,
    character: json['character'] as String?,
  );
}

Map<String, dynamic> _$MovieCastToJson(MovieCast instance) => <String, dynamic>{
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
    };
