// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'builds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BuildsResponse _$$_BuildsResponseFromJson(Map<String, dynamic> json) =>
    _$_BuildsResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Build.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BuildsResponseToJson(_$_BuildsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
