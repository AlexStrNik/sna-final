// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stages_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StagesResponse _$StagesResponseFromJson(Map<String, dynamic> json) {
  return _StagesResponse.fromJson(json);
}

/// @nodoc
mixin _$StagesResponse {
  List<Stage> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StagesResponseCopyWith<StagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StagesResponseCopyWith<$Res> {
  factory $StagesResponseCopyWith(
          StagesResponse value, $Res Function(StagesResponse) then) =
      _$StagesResponseCopyWithImpl<$Res, StagesResponse>;
  @useResult
  $Res call({List<Stage> result});
}

/// @nodoc
class _$StagesResponseCopyWithImpl<$Res, $Val extends StagesResponse>
    implements $StagesResponseCopyWith<$Res> {
  _$StagesResponseCopyWithImpl(this._value, this._then);

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
              as List<Stage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StagesResponseCopyWith<$Res>
    implements $StagesResponseCopyWith<$Res> {
  factory _$$_StagesResponseCopyWith(
          _$_StagesResponse value, $Res Function(_$_StagesResponse) then) =
      __$$_StagesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Stage> result});
}

/// @nodoc
class __$$_StagesResponseCopyWithImpl<$Res>
    extends _$StagesResponseCopyWithImpl<$Res, _$_StagesResponse>
    implements _$$_StagesResponseCopyWith<$Res> {
  __$$_StagesResponseCopyWithImpl(
      _$_StagesResponse _value, $Res Function(_$_StagesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_StagesResponse(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Stage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StagesResponse implements _StagesResponse {
  const _$_StagesResponse({required final List<Stage> result})
      : _result = result;

  factory _$_StagesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StagesResponseFromJson(json);

  final List<Stage> _result;
  @override
  List<Stage> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'StagesResponse(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StagesResponse &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StagesResponseCopyWith<_$_StagesResponse> get copyWith =>
      __$$_StagesResponseCopyWithImpl<_$_StagesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StagesResponseToJson(
      this,
    );
  }
}

abstract class _StagesResponse implements StagesResponse {
  const factory _StagesResponse({required final List<Stage> result}) =
      _$_StagesResponse;

  factory _StagesResponse.fromJson(Map<String, dynamic> json) =
      _$_StagesResponse.fromJson;

  @override
  List<Stage> get result;
  @override
  @JsonKey(ignore: true)
  _$$_StagesResponseCopyWith<_$_StagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
