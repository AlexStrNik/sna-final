// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifacts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtifactsResponse _$$_ArtifactsResponseFromJson(Map<String, dynamic> json) =>
    _$_ArtifactsResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArtifactsResponseToJson(
        _$_ArtifactsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
