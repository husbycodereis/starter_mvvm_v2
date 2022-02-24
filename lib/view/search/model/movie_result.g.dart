// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResultModel _$MovieResultModelFromJson(Map<String, dynamic> json) {
  return MovieResultModel(
    posterPath: json['poster_path'] as String?,
    adult: json['adult'] as bool?,
    overview: json['overview'] as String?,
    releaseDate: json['release_date'] as String?,
    movieId: json['id'] as int?,
    localId: json['localId'] as int?,
    originalTitle: json['original_title)'] as String?,
    originalLanguage: json['original_language'] as String?,
    title: json['title'] as String?,
    backdropPath: json['backdrop_path'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    isFavorite: json['isFavorite'] as bool?,
  );
}

Map<String, dynamic> _$MovieResultModelToJson(MovieResultModel instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'id': instance.movieId,
      'localId': instance.localId,
      'original_title)': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'isFavorite': instance.isFavorite,
    };
