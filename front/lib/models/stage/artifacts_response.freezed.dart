// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifacts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtifactsResponse _$ArtifactsResponseFromJson(Map<String, dynamic> json) {
  return _ArtifactsResponse.fromJson(json);
}

/// @nodoc
mixin _$ArtifactsResponse {
  List<Artifact> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactsResponseCopyWith<ArtifactsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactsResponseCopyWith<$Res> {
  factory $ArtifactsResponseCopyWith(
          ArtifactsResponse value, $Res Function(ArtifactsResponse) then) =
      _$ArtifactsResponseCopyWithImpl<$Res, ArtifactsResponse>;
  @useResult
  $Res call({List<Artifact> result});
}

/// @nodoc
class _$ArtifactsResponseCopyWithImpl<$Res, $Val extends ArtifactsResponse>
    implements $ArtifactsResponseCopyWith<$Res> {
  _$ArtifactsResponseCopyWithImpl(this._value, this._then);

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
              as List<Artifact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArtifactsResponseCopyWith<$Res>
    implements $ArtifactsResponseCopyWith<$Res> {
  factory _$$_ArtifactsResponseCopyWith(_$_ArtifactsResponse value,
          $Res Function(_$_ArtifactsResponse) then) =
      __$$_ArtifactsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Artifact> result});
}

/// @nodoc
class __$$_ArtifactsResponseCopyWithImpl<$Res>
    extends _$ArtifactsResponseCopyWithImpl<$Res, _$_ArtifactsResponse>
    implements _$$_ArtifactsResponseCopyWith<$Res> {
  __$$_ArtifactsResponseCopyWithImpl(
      _$_ArtifactsResponse _value, $Res Function(_$_ArtifactsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_ArtifactsResponse(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Artifact>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtifactsResponse implements _ArtifactsResponse {
  const _$_ArtifactsResponse({required final List<Artifact> result})
      : _result = result;

  factory _$_ArtifactsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ArtifactsResponseFromJson(json);

  final List<Artifact> _result;
  @override
  List<Artifact> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'ArtifactsResponse(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArtifactsResponse &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtifactsResponseCopyWith<_$_ArtifactsResponse> get copyWith =>
      __$$_ArtifactsResponseCopyWithImpl<_$_ArtifactsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtifactsResponseToJson(
      this,
    );
  }
}

abstract class _ArtifactsResponse implements ArtifactsResponse {
  const factory _ArtifactsResponse({required final List<Artifact> result}) =
      _$_ArtifactsResponse;

  factory _ArtifactsResponse.fromJson(Map<String, dynamic> json) =
      _$_ArtifactsResponse.fromJson;

  @override
  List<Artifact> get result;
  @override
  @JsonKey(ignore: true)
  _$$_ArtifactsResponseCopyWith<_$_ArtifactsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
