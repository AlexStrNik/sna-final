// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Artifact _$ArtifactFromJson(Map<String, dynamic> json) {
  return _Artifact.fromJson(json);
}

/// @nodoc
mixin _$Artifact {
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtifactCopyWith<Artifact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactCopyWith<$Res> {
  factory $ArtifactCopyWith(Artifact value, $Res Function(Artifact) then) =
      _$ArtifactCopyWithImpl<$Res, Artifact>;
  @useResult
  $Res call({String result});
}

/// @nodoc
class _$ArtifactCopyWithImpl<$Res, $Val extends Artifact>
    implements $ArtifactCopyWith<$Res> {
  _$ArtifactCopyWithImpl(this._value, this._then);

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
abstract class _$$_ArtifactCopyWith<$Res> implements $ArtifactCopyWith<$Res> {
  factory _$$_ArtifactCopyWith(
          _$_Artifact value, $Res Function(_$_Artifact) then) =
      __$$_ArtifactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result});
}

/// @nodoc
class __$$_ArtifactCopyWithImpl<$Res>
    extends _$ArtifactCopyWithImpl<$Res, _$_Artifact>
    implements _$$_ArtifactCopyWith<$Res> {
  __$$_ArtifactCopyWithImpl(
      _$_Artifact _value, $Res Function(_$_Artifact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_Artifact(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artifact with DiagnosticableTreeMixin implements _Artifact {
  const _$_Artifact({required this.result});

  factory _$_Artifact.fromJson(Map<String, dynamic> json) =>
      _$$_ArtifactFromJson(json);

  @override
  final String result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Artifact(result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Artifact'))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artifact &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtifactCopyWith<_$_Artifact> get copyWith =>
      __$$_ArtifactCopyWithImpl<_$_Artifact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtifactToJson(
      this,
    );
  }
}

abstract class _Artifact implements Artifact {
  const factory _Artifact({required final String result}) = _$_Artifact;

  factory _Artifact.fromJson(Map<String, dynamic> json) = _$_Artifact.fromJson;

  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$_ArtifactCopyWith<_$_Artifact> get copyWith =>
      throw _privateConstructorUsedError;
}
