// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  Request get req => throw _privateConstructorUsedError;
  Resource? get res => throw _privateConstructorUsedError;
  Options get opts => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({Request req, Resource? res, Options opts});

  $RequestCopyWith<$Res> get req;
  $ResourceCopyWith<$Res>? get res;
  $OptionsCopyWith<$Res> get opts;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? req = null,
    Object? res = freezed,
    Object? opts = null,
  }) {
    return _then(_value.copyWith(
      req: null == req
          ? _value.req
          : req // ignore: cast_nullable_to_non_nullable
              as Request,
      res: freezed == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Resource?,
      opts: null == opts
          ? _value.opts
          : opts // ignore: cast_nullable_to_non_nullable
              as Options,
    ) as $Val);
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestCopyWith<$Res> get req {
    return $RequestCopyWith<$Res>(_value.req, (value) {
      return _then(_value.copyWith(req: value) as $Val);
    });
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get res {
    if (_value.res == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.res!, (value) {
      return _then(_value.copyWith(res: value) as $Val);
    });
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OptionsCopyWith<$Res> get opts {
    return $OptionsCopyWith<$Res>(_value.opts, (value) {
      return _then(_value.copyWith(opts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Request req, Resource? res, Options opts});

  @override
  $RequestCopyWith<$Res> get req;
  @override
  $ResourceCopyWith<$Res>? get res;
  @override
  $OptionsCopyWith<$Res> get opts;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? req = null,
    Object? res = freezed,
    Object? opts = null,
  }) {
    return _then(_$MetaImpl(
      req: null == req
          ? _value.req
          : req // ignore: cast_nullable_to_non_nullable
              as Request,
      res: freezed == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as Resource?,
      opts: null == opts
          ? _value.opts
          : opts // ignore: cast_nullable_to_non_nullable
              as Options,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl({required this.req, this.res, required this.opts});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final Request req;
  @override
  final Resource? res;
  @override
  final Options opts;

  @override
  String toString() {
    return 'Meta(req: $req, res: $res, opts: $opts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.req, req) || other.req == req) &&
            (identical(other.res, res) || other.res == res) &&
            (identical(other.opts, opts) || other.opts == opts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, req, res, opts);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {required final Request req,
      final Resource? res,
      required final Options opts}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  Request get req;
  @override
  Resource? get res;
  @override
  Options get opts;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
