// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stage.freezed.dart';
part 'stage.g.dart';

@freezed
class Stage with _$Stage {
  const factory Stage({
    required String name,
    required int id,
    required String status,
  }) = _Stage;

  factory Stage.fromJson(Map<String, Object?> json) => _$StageFromJson(json);
}
