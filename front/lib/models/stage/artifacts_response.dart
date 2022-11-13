import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/models/stage/artifact.dart';

part 'artifacts_response.freezed.dart';
part 'artifacts_response.g.dart';

@freezed
abstract class ArtifactsResponse with _$ArtifactsResponse {
  const factory ArtifactsResponse({required List<Artifact> result}) =
      _ArtifactsResponse;

  factory ArtifactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtifactsResponseFromJson(json);
}
