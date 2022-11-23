// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'build_summary.freezed.dart';
part 'build_summary.g.dart';

@freezed
class BuildSummary with _$BuildSummary {
  const factory BuildSummary({
    required int id,
    required String status,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'repo_id') required int repoId,
    @JsonKey(name: 'branch_name') required String branchName,
    @JsonKey(name: 'commit_id') required String commitId,
    @JsonKey(name: 'commit_url') required String commitUrl,
    @JsonKey(name: 'commit_message') required String commitMessage,
  }) = _BuildSummary;

  factory BuildSummary.fromJson(Map<String, Object?> json) =>
      _$BuildSummaryFromJson(json);
}
