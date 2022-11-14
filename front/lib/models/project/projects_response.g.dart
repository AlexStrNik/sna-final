// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectsResponse _$$_ProjectsResponseFromJson(Map<String, dynamic> json) =>
    _$_ProjectsResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectsResponseToJson(_$_ProjectsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
