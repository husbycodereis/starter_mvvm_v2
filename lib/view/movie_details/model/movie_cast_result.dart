import 'package:json_annotation/json_annotation.dart';
import 'package:movies_catalog/view/movie_details/model/movie_cast.dart';
import 'package:vexana/vexana.dart';

part 'movie_cast_result.g.dart';

@JsonSerializable()
class MovieCastResponse extends INetworkModel<MovieCastResponse> {
  int? id;
  @JsonKey(name: 'cast')
  List<MovieCast>? castList;

  MovieCastResponse({
    this.id,
    this.castList,
  });

  @override
  MovieCastResponse fromJson(Map<String, dynamic> json) {
    return _$MovieCastResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MovieCastResponseToJson(this);
}
