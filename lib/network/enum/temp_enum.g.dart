// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_enum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      $enumDecode(_$TempEnumEnumMap, json['tempEnum']),
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'tempEnum': _$TempEnumEnumMap[instance.tempEnum]!,
    };

const _$TempEnumEnumMap = {
  TempEnum.originalTitle: 'original_title',
  TempEnum.posterPath: 'poster_path',
};
