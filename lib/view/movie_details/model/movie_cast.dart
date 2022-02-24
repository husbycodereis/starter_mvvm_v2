import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'movie_cast.g.dart';

@JsonSerializable()
class MovieCast with INetworkModel<MovieCast> {
  int? gender;
  int? id;
  String? name;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  String? character;

  MovieCast({
    this.gender,
    this.id,
    this.name,
    this.profilePath,
    this.character,
  });

  String get fullImageUrl => profilePath != null
      ? 'https://image.tmdb.org/t/p/w200$profilePath'
      : gender == 2 || gender == 0
          ? 'https://i.imgur.com/QJvspa9.png'
          : 'https://i.imgur.com/2mzDH4s.png';

  factory MovieCast.fromJson(Map<String, dynamic> json) => _$MovieCastFromJson(json);

  @override
  MovieCast fromJson(Map<String, dynamic> json) {
    return _$MovieCastFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MovieCastToJson(this);
}
