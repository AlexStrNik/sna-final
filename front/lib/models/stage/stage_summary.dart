// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stage_summary.freezed.dart';
part 'stage_summary.g.dart';

@freezed
class StageSummary with _$StageSummary {
  const factory StageSummary({
    required String name,
    required int id,
    required String status,
  }) = _StageSummary;

  factory StageSummary.fromJson(Map<String, Object?> json) =>
      _$StageSummaryFromJson(json);
}
