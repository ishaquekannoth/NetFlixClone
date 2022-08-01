import 'package:json_annotation/json_annotation.dart';
import 'package:netflixproject/core/constants.dart';
part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
 
  List<SearchResultData>? results;

@JsonKey(name: 'results')

  SearchResp({this.results=const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResultData {
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl=>'$imageAppendUrl$posterPath';
 SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}

