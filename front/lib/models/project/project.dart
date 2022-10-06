// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required int id,
    required String name,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'hooks_url') required String hooksUrl,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'pushed_at') required String pushedAt,
    @JsonKey(name: 'stargazers_count') required int stargazers,
    @JsonKey(name: 'watchers_count') required int watchers,
    @JsonKey(name: 'webhook_active') required bool webhookActive,
    @JsonKey(name: 'env_vars') required Map<String, String> env,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
