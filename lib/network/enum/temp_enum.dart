import 'package:json_annotation/json_annotation.dart';

part 'temp_enum.g.dart';

enum TempEnum {
  @JsonValue('original_title')
  originalTitle,
  @JsonValue('poster_path')
  posterPath
}

@JsonSerializable()
class PostData {
  TempEnum tempEnum;

  PostData(this.tempEnum);

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
