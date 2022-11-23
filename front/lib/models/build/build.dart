// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'build.freezed.dart';
part 'build.g.dart';

@freezed
class Build with _$Build {
  const factory Build({
    required int id,
    required String status,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'repo_id') required int repoId,
    @JsonKey(name: 'branch_name') required String branchName,
    @JsonKey(name: 'commit_id') required String commitId,
    @JsonKey(name: 'commit_url') required String commitUrl,
    @JsonKey(name: 'commit_message') required String commitMessage,
  }) = _Build;

  factory Build.fromJson(Map<String, Object?> json) => _$BuildFromJson(json);
}
