// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'artifact_summary.freezed.dart';
part 'artifact_summary.g.dart';

@freezed
class ArtifactSummary with _$ArtifactSummary {
  const factory ArtifactSummary({
    required String result,
  }) = _ArtifactSummary;

  factory ArtifactSummary.fromJson(Map<String, Object?> json) =>
      _$ArtifactSummaryFromJson(json);
}
