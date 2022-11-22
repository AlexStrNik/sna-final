// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectSummary _$$_ProjectSummaryFromJson(Map<String, dynamic> json) =>
    _$_ProjectSummary(
      id: json['id'] as int,
      name: json['name'] as String,
      htmlUrl: json['html_url'] as String,
      hooksUrl: json['hooks_url'] as String,
      createdAt: json['created_at'] as String,
      pushedAt: json['pushed_at'] as String,
      stargazers: json['stargazers_count'] as int,
      watchers: json['watchers_count'] as int,
      webhookActive: json['webhook_active'] as bool,
      env: Map<String, String>.from(json['env_vars'] as Map),
      languages: (json['languages'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$_ProjectSummaryToJson(_$_ProjectSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'html_url': instance.htmlUrl,
      'hooks_url': instance.hooksUrl,
      'created_at': instance.createdAt,
      'pushed_at': instance.pushedAt,
      'stargazers_count': instance.stargazers,
      'watchers_count': instance.watchers,
      'webhook_active': instance.webhookActive,
      'env_vars': instance.env,
      'languages': instance.languages,
    };
