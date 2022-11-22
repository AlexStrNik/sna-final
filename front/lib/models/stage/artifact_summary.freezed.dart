// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtifactSummary _$ArtifactSummaryFromJson(Map<String, dynamic> json) {
  return _ArtifactSummary.fromJson(json);
}

/// @nodoc
mixin _$ArtifactSummary {
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactSummaryCopyWith<ArtifactSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactSummaryCopyWith<$Res> {
  factory $ArtifactSummaryCopyWith(
          ArtifactSummary value, $Res Function(ArtifactSummary) then) =
      _$ArtifactSummaryCopyWithImpl<$Res, ArtifactSummary>;
  @useResult
  $Res call({String result});
}

/// @nodoc
class _$ArtifactSummaryCopyWithImpl<$Res, $Val extends ArtifactSummary>
    implements $ArtifactSummaryCopyWith<$Res> {
  _$ArtifactSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArtifactSummaryCopyWith<$Res>
    implements $ArtifactSummaryCopyWith<$Res> {
  factory _$$_ArtifactSummaryCopyWith(
          _$_ArtifactSummary value, $Res Function(_$_ArtifactSummary) then) =
      __$$_ArtifactSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result});
}

/// @nodoc
class __$$_ArtifactSummaryCopyWithImpl<$Res>
    extends _$ArtifactSummaryCopyWithImpl<$Res, _$_ArtifactSummary>
    implements _$$_ArtifactSummaryCopyWith<$Res> {
  __$$_ArtifactSummaryCopyWithImpl(
      _$_ArtifactSummary _value, $Res Function(_$_ArtifactSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_ArtifactSummary(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtifactSummary
    with DiagnosticableTreeMixin
    implements _ArtifactSummary {
  const _$_ArtifactSummary({required this.result});

  factory _$_ArtifactSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ArtifactSummaryFromJson(json);

  @override
  final String result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArtifactSummary(result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArtifactSummary'))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArtifactSummary &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtifactSummaryCopyWith<_$_ArtifactSummary> get copyWith =>
      __$$_ArtifactSummaryCopyWithImpl<_$_ArtifactSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtifactSummaryToJson(
      this,
    );
  }
}

abstract class _ArtifactSummary implements ArtifactSummary {
  const factory _ArtifactSummary({required final String result}) =
      _$_ArtifactSummary;

  factory _ArtifactSummary.fromJson(Map<String, dynamic> json) =
      _$_ArtifactSummary.fromJson;

  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$_ArtifactSummaryCopyWith<_$_ArtifactSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
