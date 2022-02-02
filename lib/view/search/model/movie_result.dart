import 'package:json_annotation/json_annotation.dart';
part 'movie_result.g.dart';

@JsonSerializable()
class MovieResultModel {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  bool? adult;
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  int? id;
  @JsonKey(name: 'original_title)')
  String? originalTitle;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  String? title;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  double? popularity;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  MovieResultModel({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  String get fullImageUrl =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w200$posterPath' : 'https://i.imgur.com/SuogN3V.png';

  factory MovieResultModel.fromJson(Map<String, dynamic> json) => _$MovieResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResultModelToJson(this);
}