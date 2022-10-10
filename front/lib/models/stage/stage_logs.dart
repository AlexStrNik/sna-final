// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stage_logs.freezed.dart';
part 'stage_logs.g.dart';

@freezed
class StageLogs with _$StageLogs {
  const factory StageLogs({
    required String logs,
  }) = _StageLogs;

  factory StageLogs.fromJson(Map<String, Object?> json) =>
      _$StageLogsFromJson(json);
}
