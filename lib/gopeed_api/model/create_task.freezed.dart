// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateTask _$CreateTaskFromJson(Map<String, dynamic> json) {
  return _CreateTask.fromJson(json);
}

/// @nodoc
mixin _$CreateTask {
  String? get rid => throw _privateConstructorUsedError;
  Request? get req => throw _privateConstructorUsedError;
  Options? get opt => throw _privateConstructorUsedError;

  /// Serializes this CreateTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTaskCopyWith<CreateTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskCopyWith<$Res> {
  factory $CreateTaskCopyWith(
          CreateTask value, $Res Function(CreateTask) then) =
      _$CreateTaskCopyWithImpl<$Res, CreateTask>;
  @useResult
  $Res call({String? rid, Request? req, Options? opt});

  $RequestCopyWith<$Res>? get req;
  $OptionsCopyWith<$Res>? get opt;
}

/// @nodoc
class _$CreateTaskCopyWithImpl<$Res, $Val extends CreateTask>
    implements $CreateTaskCopyWith<$Res> {
  _$CreateTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rid = freezed,
    Object? req = freezed,
    Object? opt = freezed,
  }) {
    return _then(_value.copyWith(
      rid: freezed == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String?,
      req: freezed == req
          ? _value.req
          : req // ignore: cast_nullable_to_non_nullable
              as Request?,
      opt: freezed == opt
          ? _value.opt
          : opt // ignore: cast_nullable_to_non_nullable
              as Options?,
    ) as $Val);
  }

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestCopyWith<$Res>? get req {
    if (_value.req == null) {
      return null;
    }

    return $RequestCopyWith<$Res>(_value.req!, (value) {
      return _then(_value.copyWith(req: value) as $Val);
    });
  }

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OptionsCopyWith<$Res>? get opt {
    if (_value.opt == null) {
      return null;
    }

    return $OptionsCopyWith<$Res>(_value.opt!, (value) {
      return _then(_value.copyWith(opt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateTaskImplCopyWith<$Res>
    implements $CreateTaskCopyWith<$Res> {
  factory _$$CreateTaskImplCopyWith(
          _$CreateTaskImpl value, $Res Function(_$CreateTaskImpl) then) =
      __$$CreateTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? rid, Request? req, Options? opt});

  @override
  $RequestCopyWith<$Res>? get req;
  @override
  $OptionsCopyWith<$Res>? get opt;
}

/// @nodoc
class __$$CreateTaskImplCopyWithImpl<$Res>
    extends _$CreateTaskCopyWithImpl<$Res, _$CreateTaskImpl>
    implements _$$CreateTaskImplCopyWith<$Res> {
  __$$CreateTaskImplCopyWithImpl(
      _$CreateTaskImpl _value, $Res Function(_$CreateTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rid = freezed,
    Object? req = freezed,
    Object? opt = freezed,
  }) {
    return _then(_$CreateTaskImpl(
      rid: freezed == rid
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String?,
      req: freezed == req
          ? _value.req
          : req // ignore: cast_nullable_to_non_nullable
              as Request?,
      opt: freezed == opt
          ? _value.opt
          : opt // ignore: cast_nullable_to_non_nullable
              as Options?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTaskImpl implements _CreateTask {
  const _$CreateTaskImpl({this.rid, this.req, this.opt});

  factory _$CreateTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTaskImplFromJson(json);

  @override
  final String? rid;
  @override
  final Request? req;
  @override
  final Options? opt;

  @override
  String toString() {
    return 'CreateTask(rid: $rid, req: $req, opt: $opt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskImpl &&
            (identical(other.rid, rid) || other.rid == rid) &&
            (identical(other.req, req) || other.req == req) &&
            (identical(other.opt, opt) || other.opt == opt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rid, req, opt);

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskImplCopyWith<_$CreateTaskImpl> get copyWith =>
      __$$CreateTaskImplCopyWithImpl<_$CreateTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTaskImplToJson(
      this,
    );
  }
}

abstract class _CreateTask implements CreateTask {
  const factory _CreateTask(
      {final String? rid,
      final Request? req,
      final Options? opt}) = _$CreateTaskImpl;

  factory _CreateTask.fromJson(Map<String, dynamic> json) =
      _$CreateTaskImpl.fromJson;

  @override
  String? get rid;
  @override
  Request? get req;
  @override
  Options? get opt;

  /// Create a copy of CreateTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTaskImplCopyWith<_$CreateTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
