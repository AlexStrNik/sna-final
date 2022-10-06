// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StagesResponse _$$_StagesResponseFromJson(Map<String, dynamic> json) =>
    _$_StagesResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StagesResponseToJson(_$_StagesResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
