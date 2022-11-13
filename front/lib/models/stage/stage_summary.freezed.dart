// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StageSummary _$StageSummaryFromJson(Map<String, dynamic> json) {
  return _StageSummary.fromJson(json);
}

/// @nodoc
mixin _$StageSummary {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StageSummaryCopyWith<StageSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageSummaryCopyWith<$Res> {
  factory $StageSummaryCopyWith(
          StageSummary value, $Res Function(StageSummary) then) =
      _$StageSummaryCopyWithImpl<$Res, StageSummary>;
  @useResult
  $Res call({String name, int id, String status});
}

/// @nodoc
class _$StageSummaryCopyWithImpl<$Res, $Val extends StageSummary>
    implements $StageSummaryCopyWith<$Res> {
  _$StageSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StageSummaryCopyWith<$Res>
    implements $StageSummaryCopyWith<$Res> {
  factory _$$_StageSummaryCopyWith(
          _$_StageSummary value, $Res Function(_$_StageSummary) then) =
      __$$_StageSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, String status});
}

/// @nodoc
class __$$_StageSummaryCopyWithImpl<$Res>
    extends _$StageSummaryCopyWithImpl<$Res, _$_StageSummary>
    implements _$$_StageSummaryCopyWith<$Res> {
  __$$_StageSummaryCopyWithImpl(
      _$_StageSummary _value, $Res Function(_$_StageSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_$_StageSummary(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StageSummary with DiagnosticableTreeMixin implements _StageSummary {
  const _$_StageSummary(
      {required this.name, required this.id, required this.status});

  factory _$_StageSummary.fromJson(Map<String, dynamic> json) =>
      _$$_StageSummaryFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StageSummary(name: $name, id: $id, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StageSummary'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StageSummary &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StageSummaryCopyWith<_$_StageSummary> get copyWith =>
      __$$_StageSummaryCopyWithImpl<_$_StageSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StageSummaryToJson(
      this,
    );
  }
}

abstract class _StageSummary implements StageSummary {
  const factory _StageSummary(
      {required final String name,
      required final int id,
      required final String status}) = _$_StageSummary;

  factory _StageSummary.fromJson(Map<String, dynamic> json) =
      _$_StageSummary.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_StageSummaryCopyWith<_$_StageSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
