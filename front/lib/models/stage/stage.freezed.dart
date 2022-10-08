// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stage _$StageFromJson(Map<String, dynamic> json) {
  return _Stage.fromJson(json);
}

/// @nodoc
mixin _$Stage {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StageCopyWith<Stage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageCopyWith<$Res> {
  factory $StageCopyWith(Stage value, $Res Function(Stage) then) =
      _$StageCopyWithImpl<$Res, Stage>;
  @useResult
  $Res call({String name, int id, String status});
}

/// @nodoc
class _$StageCopyWithImpl<$Res, $Val extends Stage>
    implements $StageCopyWith<$Res> {
  _$StageCopyWithImpl(this._value, this._then);

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
abstract class _$$_StageCopyWith<$Res> implements $StageCopyWith<$Res> {
  factory _$$_StageCopyWith(_$_Stage value, $Res Function(_$_Stage) then) =
      __$$_StageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, String status});
}

/// @nodoc
class __$$_StageCopyWithImpl<$Res> extends _$StageCopyWithImpl<$Res, _$_Stage>
    implements _$$_StageCopyWith<$Res> {
  __$$_StageCopyWithImpl(_$_Stage _value, $Res Function(_$_Stage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_$_Stage(
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
class _$_Stage with DiagnosticableTreeMixin implements _Stage {
  const _$_Stage({required this.name, required this.id, required this.status});

  factory _$_Stage.fromJson(Map<String, dynamic> json) =>
      _$$_StageFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stage(name: $name, id: $id, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stage'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stage &&
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
  _$$_StageCopyWith<_$_Stage> get copyWith =>
      __$$_StageCopyWithImpl<_$_Stage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StageToJson(
      this,
    );
  }
}

abstract class _Stage implements Stage {
  const factory _Stage(
      {required final String name,
      required final int id,
      required final String status}) = _$_Stage;

  factory _Stage.fromJson(Map<String, dynamic> json) = _$_Stage.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_StageCopyWith<_$_Stage> get copyWith =>
      throw _privateConstructorUsedError;
}
