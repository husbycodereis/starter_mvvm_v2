// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) {
  return SearchResultModel(
    page: json['page'] as int?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => MovieResultModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalResults: json['total_results'] as int?,
    totalPages: json['total_pages'] as int?,
  );
}

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
