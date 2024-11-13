// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return _Options.fromJson(json);
}

/// @nodoc
mixin _$Options {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<int> get selectFiles => throw _privateConstructorUsedError;
  Object? get extra => throw _privateConstructorUsedError;

  /// Serializes this Options to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionsCopyWith<Options> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsCopyWith<$Res> {
  factory $OptionsCopyWith(Options value, $Res Function(Options) then) =
      _$OptionsCopyWithImpl<$Res, Options>;
  @useResult
  $Res call({String name, String path, List<int> selectFiles, Object? extra});
}

/// @nodoc
class _$OptionsCopyWithImpl<$Res, $Val extends Options>
    implements $OptionsCopyWith<$Res> {
  _$OptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? selectFiles = null,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      selectFiles: null == selectFiles
          ? _value.selectFiles
          : selectFiles // ignore: cast_nullable_to_non_nullable
              as List<int>,
      extra: freezed == extra ? _value.extra : extra,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionsImplCopyWith<$Res> implements $OptionsCopyWith<$Res> {
  factory _$$OptionsImplCopyWith(
          _$OptionsImpl value, $Res Function(_$OptionsImpl) then) =
      __$$OptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, List<int> selectFiles, Object? extra});
}

/// @nodoc
class __$$OptionsImplCopyWithImpl<$Res>
    extends _$OptionsCopyWithImpl<$Res, _$OptionsImpl>
    implements _$$OptionsImplCopyWith<$Res> {
  __$$OptionsImplCopyWithImpl(
      _$OptionsImpl _value, $Res Function(_$OptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? selectFiles = null,
    Object? extra = freezed,
  }) {
    return _then(_$OptionsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      selectFiles: null == selectFiles
          ? _value._selectFiles
          : selectFiles // ignore: cast_nullable_to_non_nullable
              as List<int>,
      extra: freezed == extra ? _value.extra : extra,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionsImpl implements _Options {
  const _$OptionsImpl(
      {required this.name,
      required this.path,
      final List<int> selectFiles = const [],
      this.extra})
      : _selectFiles = selectFiles;

  factory _$OptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionsImplFromJson(json);

  @override
  final String name;
  @override
  final String path;
  final List<int> _selectFiles;
  @override
  @JsonKey()
  List<int> get selectFiles {
    if (_selectFiles is EqualUnmodifiableListView) return _selectFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectFiles);
  }

  @override
  final Object? extra;

  @override
  String toString() {
    return 'Options(name: $name, path: $path, selectFiles: $selectFiles, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._selectFiles, _selectFiles) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      path,
      const DeepCollectionEquality().hash(_selectFiles),
      const DeepCollectionEquality().hash(extra));

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionsImplCopyWith<_$OptionsImpl> get copyWith =>
      __$$OptionsImplCopyWithImpl<_$OptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionsImplToJson(
      this,
    );
  }
}

abstract class _Options implements Options {
  const factory _Options(
      {required final String name,
      required final String path,
      final List<int> selectFiles,
      final Object? extra}) = _$OptionsImpl;

  factory _Options.fromJson(Map<String, dynamic> json) = _$OptionsImpl.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  List<int> get selectFiles;
  @override
  Object? get extra;

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionsImplCopyWith<_$OptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptsExtraHttp _$OptsExtraHttpFromJson(Map<String, dynamic> json) {
  return _OptsExtraHttp.fromJson(json);
}

/// @nodoc
mixin _$OptsExtraHttp {
  int get connections => throw _privateConstructorUsedError;
  bool get autoTorrent => throw _privateConstructorUsedError;

  /// Serializes this OptsExtraHttp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptsExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptsExtraHttpCopyWith<OptsExtraHttp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptsExtraHttpCopyWith<$Res> {
  factory $OptsExtraHttpCopyWith(
          OptsExtraHttp value, $Res Function(OptsExtraHttp) then) =
      _$OptsExtraHttpCopyWithImpl<$Res, OptsExtraHttp>;
  @useResult
  $Res call({int connections, bool autoTorrent});
}

/// @nodoc
class _$OptsExtraHttpCopyWithImpl<$Res, $Val extends OptsExtraHttp>
    implements $OptsExtraHttpCopyWith<$Res> {
  _$OptsExtraHttpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptsExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connections = null,
    Object? autoTorrent = null,
  }) {
    return _then(_value.copyWith(
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as int,
      autoTorrent: null == autoTorrent
          ? _value.autoTorrent
          : autoTorrent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptsExtraHttpImplCopyWith<$Res>
    implements $OptsExtraHttpCopyWith<$Res> {
  factory _$$OptsExtraHttpImplCopyWith(
          _$OptsExtraHttpImpl value, $Res Function(_$OptsExtraHttpImpl) then) =
      __$$OptsExtraHttpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int connections, bool autoTorrent});
}

/// @nodoc
class __$$OptsExtraHttpImplCopyWithImpl<$Res>
    extends _$OptsExtraHttpCopyWithImpl<$Res, _$OptsExtraHttpImpl>
    implements _$$OptsExtraHttpImplCopyWith<$Res> {
  __$$OptsExtraHttpImplCopyWithImpl(
      _$OptsExtraHttpImpl _value, $Res Function(_$OptsExtraHttpImpl) _then)
      : super(_value, _then);

  /// Create a copy of OptsExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connections = null,
    Object? autoTorrent = null,
  }) {
    return _then(_$OptsExtraHttpImpl(
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as int,
      autoTorrent: null == autoTorrent
          ? _value.autoTorrent
          : autoTorrent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptsExtraHttpImpl implements _OptsExtraHttp {
  const _$OptsExtraHttpImpl({this.connections = 0, this.autoTorrent = false});

  factory _$OptsExtraHttpImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptsExtraHttpImplFromJson(json);

  @override
  @JsonKey()
  final int connections;
  @override
  @JsonKey()
  final bool autoTorrent;

  @override
  String toString() {
    return 'OptsExtraHttp(connections: $connections, autoTorrent: $autoTorrent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptsExtraHttpImpl &&
            (identical(other.connections, connections) ||
                other.connections == connections) &&
            (identical(other.autoTorrent, autoTorrent) ||
                other.autoTorrent == autoTorrent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, connections, autoTorrent);

  /// Create a copy of OptsExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptsExtraHttpImplCopyWith<_$OptsExtraHttpImpl> get copyWith =>
      __$$OptsExtraHttpImplCopyWithImpl<_$OptsExtraHttpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptsExtraHttpImplToJson(
      this,
    );
  }
}

abstract class _OptsExtraHttp implements OptsExtraHttp {
  const factory _OptsExtraHttp(
      {final int connections, final bool autoTorrent}) = _$OptsExtraHttpImpl;

  factory _OptsExtraHttp.fromJson(Map<String, dynamic> json) =
      _$OptsExtraHttpImpl.fromJson;

  @override
  int get connections;
  @override
  bool get autoTorrent;

  /// Create a copy of OptsExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptsExtraHttpImplCopyWith<_$OptsExtraHttpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
