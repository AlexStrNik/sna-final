// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'artifact.freezed.dart';
part 'artifact.g.dart';

@freezed
class Artifact with _$Artifact {
  const factory Artifact({
    required String result,
  }) = _Artifact;

  factory Artifact.fromJson(Map<String, Object?> json) =>
      _$ArtifactFromJson(json);
}
