// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StageLogs _$StageLogsFromJson(Map<String, dynamic> json) {
  return _StageLogs.fromJson(json);
}

/// @nodoc
mixin _$StageLogs {
  String get logs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StageLogsCopyWith<StageLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageLogsCopyWith<$Res> {
  factory $StageLogsCopyWith(StageLogs value, $Res Function(StageLogs) then) =
      _$StageLogsCopyWithImpl<$Res, StageLogs>;
  @useResult
  $Res call({String logs});
}

/// @nodoc
class _$StageLogsCopyWithImpl<$Res, $Val extends StageLogs>
    implements $StageLogsCopyWith<$Res> {
  _$StageLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StageLogsCopyWith<$Res> implements $StageLogsCopyWith<$Res> {
  factory _$$_StageLogsCopyWith(
          _$_StageLogs value, $Res Function(_$_StageLogs) then) =
      __$$_StageLogsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String logs});
}

/// @nodoc
class __$$_StageLogsCopyWithImpl<$Res>
    extends _$StageLogsCopyWithImpl<$Res, _$_StageLogs>
    implements _$$_StageLogsCopyWith<$Res> {
  __$$_StageLogsCopyWithImpl(
      _$_StageLogs _value, $Res Function(_$_StageLogs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_$_StageLogs(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StageLogs with DiagnosticableTreeMixin implements _StageLogs {
  const _$_StageLogs({required this.logs});

  factory _$_StageLogs.fromJson(Map<String, dynamic> json) =>
      _$$_StageLogsFromJson(json);

  @override
  final String logs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StageLogs(logs: $logs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StageLogs'))
      ..add(DiagnosticsProperty('logs', logs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StageLogs &&
            (identical(other.logs, logs) || other.logs == logs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, logs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StageLogsCopyWith<_$_StageLogs> get copyWith =>
      __$$_StageLogsCopyWithImpl<_$_StageLogs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StageLogsToJson(
      this,
    );
  }
}

abstract class _StageLogs implements StageLogs {
  const factory _StageLogs({required final String logs}) = _$_StageLogs;

  factory _StageLogs.fromJson(Map<String, dynamic> json) =
      _$_StageLogs.fromJson;

  @override
  String get logs;
  @override
  @JsonKey(ignore: true)
  _$$_StageLogsCopyWith<_$_StageLogs> get copyWith =>
      throw _privateConstructorUsedError;
}
