// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Build _$$_BuildFromJson(Map<String, dynamic> json) => _$_Build(
      id: json['id'] as int,
      status: json['status'] as String,
      userId: json['user_id'] as int,
      repoId: json['repo_id'] as int,
      branchName: json['branch_name'] as String,
      commitId: json['commit_id'] as String,
      commitUrl: json['commit_url'] as String,
      commitMessage: json['commit_message'] as String,
    );

Map<String, dynamic> _$$_BuildToJson(_$_Build instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'user_id': instance.userId,
      'repo_id': instance.repoId,
      'branch_name': instance.branchName,
      'commit_id': instance.commitId,
      'commit_url': instance.commitUrl,
      'commit_message': instance.commitMessage,
    };
