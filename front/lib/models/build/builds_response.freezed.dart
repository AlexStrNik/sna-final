// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'builds_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuildsResponse _$BuildsResponseFromJson(Map<String, dynamic> json) {
  return _BuildsResponse.fromJson(json);
}

/// @nodoc
mixin _$BuildsResponse {
  List<Build> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildsResponseCopyWith<BuildsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildsResponseCopyWith<$Res> {
  factory $BuildsResponseCopyWith(
          BuildsResponse value, $Res Function(BuildsResponse) then) =
      _$BuildsResponseCopyWithImpl<$Res, BuildsResponse>;
  @useResult
  $Res call({List<Build> result});
}

/// @nodoc
class _$BuildsResponseCopyWithImpl<$Res, $Val extends BuildsResponse>
    implements $BuildsResponseCopyWith<$Res> {
  _$BuildsResponseCopyWithImpl(this._value, this._then);

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
              as List<Build>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BuildsResponseCopyWith<$Res>
    implements $BuildsResponseCopyWith<$Res> {
  factory _$$_BuildsResponseCopyWith(
          _$_BuildsResponse value, $Res Function(_$_BuildsResponse) then) =
      __$$_BuildsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Build> result});
}

/// @nodoc
class __$$_BuildsResponseCopyWithImpl<$Res>
    extends _$BuildsResponseCopyWithImpl<$Res, _$_BuildsResponse>
    implements _$$_BuildsResponseCopyWith<$Res> {
  __$$_BuildsResponseCopyWithImpl(
      _$_BuildsResponse _value, $Res Function(_$_BuildsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_BuildsResponse(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Build>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BuildsResponse implements _BuildsResponse {
  const _$_BuildsResponse({required final List<Build> result})
      : _result = result;

  factory _$_BuildsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BuildsResponseFromJson(json);

  final List<Build> _result;
  @override
  List<Build> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'BuildsResponse(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BuildsResponse &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuildsResponseCopyWith<_$_BuildsResponse> get copyWith =>
      __$$_BuildsResponseCopyWithImpl<_$_BuildsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BuildsResponseToJson(
      this,
    );
  }
}

abstract class _BuildsResponse implements BuildsResponse {
  const factory _BuildsResponse({required final List<Build> result}) =
      _$_BuildsResponse;

  factory _BuildsResponse.fromJson(Map<String, dynamic> json) =
      _$_BuildsResponse.fromJson;

  @override
  List<Build> get result;
  @override
  @JsonKey(ignore: true)
  _$$_BuildsResponseCopyWith<_$_BuildsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
