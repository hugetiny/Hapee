// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartConfig _$StartConfigFromJson(Map<String, dynamic> json) {
  return _StartConfig.fromJson(json);
}

/// @nodoc
mixin _$StartConfig {
  String get network => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get storage => throw _privateConstructorUsedError;
  String get storageDir => throw _privateConstructorUsedError;
  int get refreshInterval => throw _privateConstructorUsedError;
  String get apiToken => throw _privateConstructorUsedError;

  /// Serializes this StartConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartConfigCopyWith<StartConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartConfigCopyWith<$Res> {
  factory $StartConfigCopyWith(
          StartConfig value, $Res Function(StartConfig) then) =
      _$StartConfigCopyWithImpl<$Res, StartConfig>;
  @useResult
  $Res call(
      {String network,
      String address,
      String storage,
      String storageDir,
      int refreshInterval,
      String apiToken});
}

/// @nodoc
class _$StartConfigCopyWithImpl<$Res, $Val extends StartConfig>
    implements $StartConfigCopyWith<$Res> {
  _$StartConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? network = null,
    Object? address = null,
    Object? storage = null,
    Object? storageDir = null,
    Object? refreshInterval = null,
    Object? apiToken = null,
  }) {
    return _then(_value.copyWith(
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as String,
      storageDir: null == storageDir
          ? _value.storageDir
          : storageDir // ignore: cast_nullable_to_non_nullable
              as String,
      refreshInterval: null == refreshInterval
          ? _value.refreshInterval
          : refreshInterval // ignore: cast_nullable_to_non_nullable
              as int,
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartConfigImplCopyWith<$Res>
    implements $StartConfigCopyWith<$Res> {
  factory _$$StartConfigImplCopyWith(
          _$StartConfigImpl value, $Res Function(_$StartConfigImpl) then) =
      __$$StartConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String network,
      String address,
      String storage,
      String storageDir,
      int refreshInterval,
      String apiToken});
}

/// @nodoc
class __$$StartConfigImplCopyWithImpl<$Res>
    extends _$StartConfigCopyWithImpl<$Res, _$StartConfigImpl>
    implements _$$StartConfigImplCopyWith<$Res> {
  __$$StartConfigImplCopyWithImpl(
      _$StartConfigImpl _value, $Res Function(_$StartConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? network = null,
    Object? address = null,
    Object? storage = null,
    Object? storageDir = null,
    Object? refreshInterval = null,
    Object? apiToken = null,
  }) {
    return _then(_$StartConfigImpl(
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as String,
      storageDir: null == storageDir
          ? _value.storageDir
          : storageDir // ignore: cast_nullable_to_non_nullable
              as String,
      refreshInterval: null == refreshInterval
          ? _value.refreshInterval
          : refreshInterval // ignore: cast_nullable_to_non_nullable
              as int,
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartConfigImpl implements _StartConfig {
  const _$StartConfigImpl(
      {this.network = '',
      this.address = '',
      this.storage = 'bolt',
      this.storageDir = '',
      this.refreshInterval = 0,
      this.apiToken = ''});

  factory _$StartConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartConfigImplFromJson(json);

  @override
  @JsonKey()
  final String network;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String storage;
  @override
  @JsonKey()
  final String storageDir;
  @override
  @JsonKey()
  final int refreshInterval;
  @override
  @JsonKey()
  final String apiToken;

  @override
  String toString() {
    return 'StartConfig(network: $network, address: $address, storage: $storage, storageDir: $storageDir, refreshInterval: $refreshInterval, apiToken: $apiToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartConfigImpl &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.storageDir, storageDir) ||
                other.storageDir == storageDir) &&
            (identical(other.refreshInterval, refreshInterval) ||
                other.refreshInterval == refreshInterval) &&
            (identical(other.apiToken, apiToken) ||
                other.apiToken == apiToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, network, address, storage,
      storageDir, refreshInterval, apiToken);

  /// Create a copy of StartConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartConfigImplCopyWith<_$StartConfigImpl> get copyWith =>
      __$$StartConfigImplCopyWithImpl<_$StartConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartConfigImplToJson(
      this,
    );
  }
}

abstract class _StartConfig implements StartConfig {
  const factory _StartConfig(
      {final String network,
      final String address,
      final String storage,
      final String storageDir,
      final int refreshInterval,
      final String apiToken}) = _$StartConfigImpl;

  factory _StartConfig.fromJson(Map<String, dynamic> json) =
      _$StartConfigImpl.fromJson;

  @override
  String get network;
  @override
  String get address;
  @override
  String get storage;
  @override
  String get storageDir;
  @override
  int get refreshInterval;
  @override
  String get apiToken;

  /// Create a copy of StartConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartConfigImplCopyWith<_$StartConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
