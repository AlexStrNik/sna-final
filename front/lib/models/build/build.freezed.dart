// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Build _$BuildFromJson(Map<String, dynamic> json) {
  return _Build.fromJson(json);
}

/// @nodoc
mixin _$Build {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'repo_id')
  int get repoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'commit_id')
  String get commitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'commit_url')
  String get commitUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'commit_message')
  String get commitMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildCopyWith<Build> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildCopyWith<$Res> {
  factory $BuildCopyWith(Build value, $Res Function(Build) then) =
      _$BuildCopyWithImpl<$Res, Build>;
  @useResult
  $Res call(
      {int id,
      String status,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'repo_id') int repoId,
      @JsonKey(name: 'branch_name') String branchName,
      @JsonKey(name: 'commit_id') String commitId,
      @JsonKey(name: 'commit_url') String commitUrl,
      @JsonKey(name: 'commit_message') String commitMessage});
}

/// @nodoc
class _$BuildCopyWithImpl<$Res, $Val extends Build>
    implements $BuildCopyWith<$Res> {
  _$BuildCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? userId = null,
    Object? repoId = null,
    Object? branchName = null,
    Object? commitId = null,
    Object? commitUrl = null,
    Object? commitMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      repoId: null == repoId
          ? _value.repoId
          : repoId // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      commitId: null == commitId
          ? _value.commitId
          : commitId // ignore: cast_nullable_to_non_nullable
              as String,
      commitUrl: null == commitUrl
          ? _value.commitUrl
          : commitUrl // ignore: cast_nullable_to_non_nullable
              as String,
      commitMessage: null == commitMessage
          ? _value.commitMessage
          : commitMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BuildCopyWith<$Res> implements $BuildCopyWith<$Res> {
  factory _$$_BuildCopyWith(_$_Build value, $Res Function(_$_Build) then) =
      __$$_BuildCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String status,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'repo_id') int repoId,
      @JsonKey(name: 'branch_name') String branchName,
      @JsonKey(name: 'commit_id') String commitId,
      @JsonKey(name: 'commit_url') String commitUrl,
      @JsonKey(name: 'commit_message') String commitMessage});
}

/// @nodoc
class __$$_BuildCopyWithImpl<$Res> extends _$BuildCopyWithImpl<$Res, _$_Build>
    implements _$$_BuildCopyWith<$Res> {
  __$$_BuildCopyWithImpl(_$_Build _value, $Res Function(_$_Build) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? userId = null,
    Object? repoId = null,
    Object? branchName = null,
    Object? commitId = null,
    Object? commitUrl = null,
    Object? commitMessage = null,
  }) {
    return _then(_$_Build(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      repoId: null == repoId
          ? _value.repoId
          : repoId // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      commitId: null == commitId
          ? _value.commitId
          : commitId // ignore: cast_nullable_to_non_nullable
              as String,
      commitUrl: null == commitUrl
          ? _value.commitUrl
          : commitUrl // ignore: cast_nullable_to_non_nullable
              as String,
      commitMessage: null == commitMessage
          ? _value.commitMessage
          : commitMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Build with DiagnosticableTreeMixin implements _Build {
  const _$_Build(
      {required this.id,
      required this.status,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'repo_id') required this.repoId,
      @JsonKey(name: 'branch_name') required this.branchName,
      @JsonKey(name: 'commit_id') required this.commitId,
      @JsonKey(name: 'commit_url') required this.commitUrl,
      @JsonKey(name: 'commit_message') required this.commitMessage});

  factory _$_Build.fromJson(Map<String, dynamic> json) =>
      _$$_BuildFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'repo_id')
  final int repoId;
  @override
  @JsonKey(name: 'branch_name')
  final String branchName;
  @override
  @JsonKey(name: 'commit_id')
  final String commitId;
  @override
  @JsonKey(name: 'commit_url')
  final String commitUrl;
  @override
  @JsonKey(name: 'commit_message')
  final String commitMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Build(id: $id, status: $status, userId: $userId, repoId: $repoId, branchName: $branchName, commitId: $commitId, commitUrl: $commitUrl, commitMessage: $commitMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Build'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('repoId', repoId))
      ..add(DiagnosticsProperty('branchName', branchName))
      ..add(DiagnosticsProperty('commitId', commitId))
      ..add(DiagnosticsProperty('commitUrl', commitUrl))
      ..add(DiagnosticsProperty('commitMessage', commitMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Build &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.repoId, repoId) || other.repoId == repoId) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.commitId, commitId) ||
                other.commitId == commitId) &&
            (identical(other.commitUrl, commitUrl) ||
                other.commitUrl == commitUrl) &&
            (identical(other.commitMessage, commitMessage) ||
                other.commitMessage == commitMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, userId, repoId,
      branchName, commitId, commitUrl, commitMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuildCopyWith<_$_Build> get copyWith =>
      __$$_BuildCopyWithImpl<_$_Build>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BuildToJson(
      this,
    );
  }
}

abstract class _Build implements Build {
  const factory _Build(
      {required final int id,
      required final String status,
      @JsonKey(name: 'user_id')
          required final int userId,
      @JsonKey(name: 'repo_id')
          required final int repoId,
      @JsonKey(name: 'branch_name')
          required final String branchName,
      @JsonKey(name: 'commit_id')
          required final String commitId,
      @JsonKey(name: 'commit_url')
          required final String commitUrl,
      @JsonKey(name: 'commit_message')
          required final String commitMessage}) = _$_Build;

  factory _Build.fromJson(Map<String, dynamic> json) = _$_Build.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'repo_id')
  int get repoId;
  @override
  @JsonKey(name: 'branch_name')
  String get branchName;
  @override
  @JsonKey(name: 'commit_id')
  String get commitId;
  @override
  @JsonKey(name: 'commit_url')
  String get commitUrl;
  @override
  @JsonKey(name: 'commit_message')
  String get commitMessage;
  @override
  @JsonKey(ignore: true)
  _$$_BuildCopyWith<_$_Build> get copyWith =>
      throw _privateConstructorUsedError;
}
