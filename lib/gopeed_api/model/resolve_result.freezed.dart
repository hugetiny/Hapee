// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolve_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResolveResult _$ResolveResultFromJson(Map<String, dynamic> json) {
  return _ResolveResult.fromJson(json);
}

/// @nodoc
mixin _$ResolveResult {
  String get id => throw _privateConstructorUsedError;
  Resource get res => throw _privateConstructorUsedError;

  /// Serializes this ResolveResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResolveResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResolveResultCopyWith<ResolveResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolveResultCopyWith<$Res> {
  factory $ResolveResultCopyWith(
          ResolveResult value, $Res Function(ResolveResult) then) =
      _$ResolveResultCopyWithImpl<$Res, ResolveResult>;
  @useResult
  $Res call({String id, Resource res});

  $ResourceCopyWith<$Res> get res;
}

/// @nodoc
class _$ResolveResultCopyWithImpl<$Res, $Val extends ResolveResult>
    implements $ResolveResultCopyWith<$Res> {
  _$ResolveResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResolveResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? res = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Resource,
    ) as $Val);
  }

  /// Create a copy of ResolveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res> get res {
    return $ResourceCopyWith<$Res>(_value.res, (value) {
      return _then(_value.copyWith(res: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResolveResultImplCopyWith<$Res>
    implements $ResolveResultCopyWith<$Res> {
  factory _$$ResolveResultImplCopyWith(
          _$ResolveResultImpl value, $Res Function(_$ResolveResultImpl) then) =
      __$$ResolveResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Resource res});

  @override
  $ResourceCopyWith<$Res> get res;
}

/// @nodoc
class __$$ResolveResultImplCopyWithImpl<$Res>
    extends _$ResolveResultCopyWithImpl<$Res, _$ResolveResultImpl>
    implements _$$ResolveResultImplCopyWith<$Res> {
  __$$ResolveResultImplCopyWithImpl(
      _$ResolveResultImpl _value, $Res Function(_$ResolveResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResolveResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? res = null,
  }) {
    return _then(_$ResolveResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Resource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResolveResultImpl implements _ResolveResult {
  const _$ResolveResultImpl({this.id = "", required this.res});

  factory _$ResolveResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResolveResultImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final Resource res;

  @override
  String toString() {
    return 'ResolveResult(id: $id, res: $res)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResolveResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.res, res) || other.res == res));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, res);

  /// Create a copy of ResolveResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResolveResultImplCopyWith<_$ResolveResultImpl> get copyWith =>
      __$$ResolveResultImplCopyWithImpl<_$ResolveResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResolveResultImplToJson(
      this,
    );
  }
}

abstract class _ResolveResult implements ResolveResult {
  const factory _ResolveResult({final String id, required final Resource res}) =
      _$ResolveResultImpl;

  factory _ResolveResult.fromJson(Map<String, dynamic> json) =
      _$ResolveResultImpl.fromJson;

  @override
  String get id;
  @override
  Resource get res;

  /// Create a copy of ResolveResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResolveResultImplCopyWith<_$ResolveResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
