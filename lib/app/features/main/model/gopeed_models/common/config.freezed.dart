// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DownloaderConfig _$DownloaderConfigFromJson(Map<String, dynamic> json) {
  return _DownloaderConfig.fromJson(json);
}

/// @nodoc
mixin _$DownloaderConfig {
  String get downloadDir => throw _privateConstructorUsedError;
  int get maxRunning => throw _privateConstructorUsedError;
  ProtocolConfig get protocolConfig => throw _privateConstructorUsedError;
  ExtraConfig get extra => throw _privateConstructorUsedError;
  ProxyConfig get proxy => throw _privateConstructorUsedError;

  /// Serializes this DownloaderConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloaderConfigCopyWith<DownloaderConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloaderConfigCopyWith<$Res> {
  factory $DownloaderConfigCopyWith(
          DownloaderConfig value, $Res Function(DownloaderConfig) then) =
      _$DownloaderConfigCopyWithImpl<$Res, DownloaderConfig>;
  @useResult
  $Res call(
      {String downloadDir,
      int maxRunning,
      ProtocolConfig protocolConfig,
      ExtraConfig extra,
      ProxyConfig proxy});

  $ProtocolConfigCopyWith<$Res> get protocolConfig;
  $ExtraConfigCopyWith<$Res> get extra;
  $ProxyConfigCopyWith<$Res> get proxy;
}

/// @nodoc
class _$DownloaderConfigCopyWithImpl<$Res, $Val extends DownloaderConfig>
    implements $DownloaderConfigCopyWith<$Res> {
  _$DownloaderConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadDir = null,
    Object? maxRunning = null,
    Object? protocolConfig = null,
    Object? extra = null,
    Object? proxy = null,
  }) {
    return _then(_value.copyWith(
      downloadDir: null == downloadDir
          ? _value.downloadDir
          : downloadDir // ignore: cast_nullable_to_non_nullable
              as String,
      maxRunning: null == maxRunning
          ? _value.maxRunning
          : maxRunning // ignore: cast_nullable_to_non_nullable
              as int,
      protocolConfig: null == protocolConfig
          ? _value.protocolConfig
          : protocolConfig // ignore: cast_nullable_to_non_nullable
              as ProtocolConfig,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as ExtraConfig,
      proxy: null == proxy
          ? _value.proxy
          : proxy // ignore: cast_nullable_to_non_nullable
              as ProxyConfig,
    ) as $Val);
  }

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProtocolConfigCopyWith<$Res> get protocolConfig {
    return $ProtocolConfigCopyWith<$Res>(_value.protocolConfig, (value) {
      return _then(_value.copyWith(protocolConfig: value) as $Val);
    });
  }

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtraConfigCopyWith<$Res> get extra {
    return $ExtraConfigCopyWith<$Res>(_value.extra, (value) {
      return _then(_value.copyWith(extra: value) as $Val);
    });
  }

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProxyConfigCopyWith<$Res> get proxy {
    return $ProxyConfigCopyWith<$Res>(_value.proxy, (value) {
      return _then(_value.copyWith(proxy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloaderConfigImplCopyWith<$Res>
    implements $DownloaderConfigCopyWith<$Res> {
  factory _$$DownloaderConfigImplCopyWith(_$DownloaderConfigImpl value,
          $Res Function(_$DownloaderConfigImpl) then) =
      __$$DownloaderConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String downloadDir,
      int maxRunning,
      ProtocolConfig protocolConfig,
      ExtraConfig extra,
      ProxyConfig proxy});

  @override
  $ProtocolConfigCopyWith<$Res> get protocolConfig;
  @override
  $ExtraConfigCopyWith<$Res> get extra;
  @override
  $ProxyConfigCopyWith<$Res> get proxy;
}

/// @nodoc
class __$$DownloaderConfigImplCopyWithImpl<$Res>
    extends _$DownloaderConfigCopyWithImpl<$Res, _$DownloaderConfigImpl>
    implements _$$DownloaderConfigImplCopyWith<$Res> {
  __$$DownloaderConfigImplCopyWithImpl(_$DownloaderConfigImpl _value,
      $Res Function(_$DownloaderConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadDir = null,
    Object? maxRunning = null,
    Object? protocolConfig = null,
    Object? extra = null,
    Object? proxy = null,
  }) {
    return _then(_$DownloaderConfigImpl(
      downloadDir: null == downloadDir
          ? _value.downloadDir
          : downloadDir // ignore: cast_nullable_to_non_nullable
              as String,
      maxRunning: null == maxRunning
          ? _value.maxRunning
          : maxRunning // ignore: cast_nullable_to_non_nullable
              as int,
      protocolConfig: null == protocolConfig
          ? _value.protocolConfig
          : protocolConfig // ignore: cast_nullable_to_non_nullable
              as ProtocolConfig,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as ExtraConfig,
      proxy: null == proxy
          ? _value.proxy
          : proxy // ignore: cast_nullable_to_non_nullable
              as ProxyConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloaderConfigImpl implements _DownloaderConfig {
  const _$DownloaderConfigImpl(
      {this.downloadDir = '',
      this.maxRunning = 0,
      this.protocolConfig = const ProtocolConfig(),
      this.extra = const ExtraConfig(),
      this.proxy = const ProxyConfig()})
      : assert(maxRunning >= 0, 'maxRunning must be non-negative');

  factory _$DownloaderConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloaderConfigImplFromJson(json);

  @override
  @JsonKey()
  final String downloadDir;
  @override
  @JsonKey()
  final int maxRunning;
  @override
  @JsonKey()
  final ProtocolConfig protocolConfig;
  @override
  @JsonKey()
  final ExtraConfig extra;
  @override
  @JsonKey()
  final ProxyConfig proxy;

  @override
  String toString() {
    return 'DownloaderConfig(downloadDir: $downloadDir, maxRunning: $maxRunning, protocolConfig: $protocolConfig, extra: $extra, proxy: $proxy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloaderConfigImpl &&
            (identical(other.downloadDir, downloadDir) ||
                other.downloadDir == downloadDir) &&
            (identical(other.maxRunning, maxRunning) ||
                other.maxRunning == maxRunning) &&
            (identical(other.protocolConfig, protocolConfig) ||
                other.protocolConfig == protocolConfig) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.proxy, proxy) || other.proxy == proxy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, downloadDir, maxRunning, protocolConfig, extra, proxy);

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloaderConfigImplCopyWith<_$DownloaderConfigImpl> get copyWith =>
      __$$DownloaderConfigImplCopyWithImpl<_$DownloaderConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloaderConfigImplToJson(
      this,
    );
  }
}

abstract class _DownloaderConfig implements DownloaderConfig {
  const factory _DownloaderConfig(
      {final String downloadDir,
      final int maxRunning,
      final ProtocolConfig protocolConfig,
      final ExtraConfig extra,
      final ProxyConfig proxy}) = _$DownloaderConfigImpl;

  factory _DownloaderConfig.fromJson(Map<String, dynamic> json) =
      _$DownloaderConfigImpl.fromJson;

  @override
  String get downloadDir;
  @override
  int get maxRunning;
  @override
  ProtocolConfig get protocolConfig;
  @override
  ExtraConfig get extra;
  @override
  ProxyConfig get proxy;

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloaderConfigImplCopyWith<_$DownloaderConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProtocolConfig _$ProtocolConfigFromJson(Map<String, dynamic> json) {
  return _ProtocolConfig.fromJson(json);
}

/// @nodoc
mixin _$ProtocolConfig {
  HttpConfig get http => throw _privateConstructorUsedError;
  BtConfig get bt => throw _privateConstructorUsedError;

  /// Serializes this ProtocolConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtocolConfigCopyWith<ProtocolConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolConfigCopyWith<$Res> {
  factory $ProtocolConfigCopyWith(
          ProtocolConfig value, $Res Function(ProtocolConfig) then) =
      _$ProtocolConfigCopyWithImpl<$Res, ProtocolConfig>;
  @useResult
  $Res call({HttpConfig http, BtConfig bt});

  $HttpConfigCopyWith<$Res> get http;
  $BtConfigCopyWith<$Res> get bt;
}

/// @nodoc
class _$ProtocolConfigCopyWithImpl<$Res, $Val extends ProtocolConfig>
    implements $ProtocolConfigCopyWith<$Res> {
  _$ProtocolConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? http = null,
    Object? bt = null,
  }) {
    return _then(_value.copyWith(
      http: null == http
          ? _value.http
          : http // ignore: cast_nullable_to_non_nullable
              as HttpConfig,
      bt: null == bt
          ? _value.bt
          : bt // ignore: cast_nullable_to_non_nullable
              as BtConfig,
    ) as $Val);
  }

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HttpConfigCopyWith<$Res> get http {
    return $HttpConfigCopyWith<$Res>(_value.http, (value) {
      return _then(_value.copyWith(http: value) as $Val);
    });
  }

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtConfigCopyWith<$Res> get bt {
    return $BtConfigCopyWith<$Res>(_value.bt, (value) {
      return _then(_value.copyWith(bt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProtocolConfigImplCopyWith<$Res>
    implements $ProtocolConfigCopyWith<$Res> {
  factory _$$ProtocolConfigImplCopyWith(_$ProtocolConfigImpl value,
          $Res Function(_$ProtocolConfigImpl) then) =
      __$$ProtocolConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HttpConfig http, BtConfig bt});

  @override
  $HttpConfigCopyWith<$Res> get http;
  @override
  $BtConfigCopyWith<$Res> get bt;
}

/// @nodoc
class __$$ProtocolConfigImplCopyWithImpl<$Res>
    extends _$ProtocolConfigCopyWithImpl<$Res, _$ProtocolConfigImpl>
    implements _$$ProtocolConfigImplCopyWith<$Res> {
  __$$ProtocolConfigImplCopyWithImpl(
      _$ProtocolConfigImpl _value, $Res Function(_$ProtocolConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? http = null,
    Object? bt = null,
  }) {
    return _then(_$ProtocolConfigImpl(
      http: null == http
          ? _value.http
          : http // ignore: cast_nullable_to_non_nullable
              as HttpConfig,
      bt: null == bt
          ? _value.bt
          : bt // ignore: cast_nullable_to_non_nullable
              as BtConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtocolConfigImpl implements _ProtocolConfig {
  const _$ProtocolConfigImpl(
      {this.http = const HttpConfig(), this.bt = const BtConfig()});

  factory _$ProtocolConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProtocolConfigImplFromJson(json);

  @override
  @JsonKey()
  final HttpConfig http;
  @override
  @JsonKey()
  final BtConfig bt;

  @override
  String toString() {
    return 'ProtocolConfig(http: $http, bt: $bt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolConfigImpl &&
            (identical(other.http, http) || other.http == http) &&
            (identical(other.bt, bt) || other.bt == bt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, http, bt);

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolConfigImplCopyWith<_$ProtocolConfigImpl> get copyWith =>
      __$$ProtocolConfigImplCopyWithImpl<_$ProtocolConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtocolConfigImplToJson(
      this,
    );
  }
}

abstract class _ProtocolConfig implements ProtocolConfig {
  const factory _ProtocolConfig({final HttpConfig http, final BtConfig bt}) =
      _$ProtocolConfigImpl;

  factory _ProtocolConfig.fromJson(Map<String, dynamic> json) =
      _$ProtocolConfigImpl.fromJson;

  @override
  HttpConfig get http;
  @override
  BtConfig get bt;

  /// Create a copy of ProtocolConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtocolConfigImplCopyWith<_$ProtocolConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HttpConfig _$HttpConfigFromJson(Map<String, dynamic> json) {
  return _HttpConfig.fromJson(json);
}

/// @nodoc
mixin _$HttpConfig {
  String get userAgent => throw _privateConstructorUsedError;
  int get connections => throw _privateConstructorUsedError;
  bool get useServerCtime => throw _privateConstructorUsedError;

  /// Serializes this HttpConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HttpConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HttpConfigCopyWith<HttpConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpConfigCopyWith<$Res> {
  factory $HttpConfigCopyWith(
          HttpConfig value, $Res Function(HttpConfig) then) =
      _$HttpConfigCopyWithImpl<$Res, HttpConfig>;
  @useResult
  $Res call({String userAgent, int connections, bool useServerCtime});
}

/// @nodoc
class _$HttpConfigCopyWithImpl<$Res, $Val extends HttpConfig>
    implements $HttpConfigCopyWith<$Res> {
  _$HttpConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAgent = null,
    Object? connections = null,
    Object? useServerCtime = null,
  }) {
    return _then(_value.copyWith(
      userAgent: null == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as int,
      useServerCtime: null == useServerCtime
          ? _value.useServerCtime
          : useServerCtime // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HttpConfigImplCopyWith<$Res>
    implements $HttpConfigCopyWith<$Res> {
  factory _$$HttpConfigImplCopyWith(
          _$HttpConfigImpl value, $Res Function(_$HttpConfigImpl) then) =
      __$$HttpConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userAgent, int connections, bool useServerCtime});
}

/// @nodoc
class __$$HttpConfigImplCopyWithImpl<$Res>
    extends _$HttpConfigCopyWithImpl<$Res, _$HttpConfigImpl>
    implements _$$HttpConfigImplCopyWith<$Res> {
  __$$HttpConfigImplCopyWithImpl(
      _$HttpConfigImpl _value, $Res Function(_$HttpConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAgent = null,
    Object? connections = null,
    Object? useServerCtime = null,
  }) {
    return _then(_$HttpConfigImpl(
      userAgent: null == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as int,
      useServerCtime: null == useServerCtime
          ? _value.useServerCtime
          : useServerCtime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HttpConfigImpl implements _HttpConfig {
  const _$HttpConfigImpl(
      {this.userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
              '(KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36',
      this.connections = 16,
      this.useServerCtime = false});

  factory _$HttpConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$HttpConfigImplFromJson(json);

  @override
  @JsonKey()
  final String userAgent;
  @override
  @JsonKey()
  final int connections;
  @override
  @JsonKey()
  final bool useServerCtime;

  @override
  String toString() {
    return 'HttpConfig(userAgent: $userAgent, connections: $connections, useServerCtime: $useServerCtime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpConfigImpl &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            (identical(other.connections, connections) ||
                other.connections == connections) &&
            (identical(other.useServerCtime, useServerCtime) ||
                other.useServerCtime == useServerCtime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userAgent, connections, useServerCtime);

  /// Create a copy of HttpConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpConfigImplCopyWith<_$HttpConfigImpl> get copyWith =>
      __$$HttpConfigImplCopyWithImpl<_$HttpConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HttpConfigImplToJson(
      this,
    );
  }
}

abstract class _HttpConfig implements HttpConfig {
  const factory _HttpConfig(
      {final String userAgent,
      final int connections,
      final bool useServerCtime}) = _$HttpConfigImpl;

  factory _HttpConfig.fromJson(Map<String, dynamic> json) =
      _$HttpConfigImpl.fromJson;

  @override
  String get userAgent;
  @override
  int get connections;
  @override
  bool get useServerCtime;

  /// Create a copy of HttpConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpConfigImplCopyWith<_$HttpConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BtConfig _$BtConfigFromJson(Map<String, dynamic> json) {
  return _BtConfig.fromJson(json);
}

/// @nodoc
mixin _$BtConfig {
  int get listenPort => throw _privateConstructorUsedError;
  List<String> get trackers => throw _privateConstructorUsedError;

  /// Serializes this BtConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BtConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BtConfigCopyWith<BtConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtConfigCopyWith<$Res> {
  factory $BtConfigCopyWith(BtConfig value, $Res Function(BtConfig) then) =
      _$BtConfigCopyWithImpl<$Res, BtConfig>;
  @useResult
  $Res call({int listenPort, List<String> trackers});
}

/// @nodoc
class _$BtConfigCopyWithImpl<$Res, $Val extends BtConfig>
    implements $BtConfigCopyWith<$Res> {
  _$BtConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BtConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listenPort = null,
    Object? trackers = null,
  }) {
    return _then(_value.copyWith(
      listenPort: null == listenPort
          ? _value.listenPort
          : listenPort // ignore: cast_nullable_to_non_nullable
              as int,
      trackers: null == trackers
          ? _value.trackers
          : trackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BtConfigImplCopyWith<$Res>
    implements $BtConfigCopyWith<$Res> {
  factory _$$BtConfigImplCopyWith(
          _$BtConfigImpl value, $Res Function(_$BtConfigImpl) then) =
      __$$BtConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int listenPort, List<String> trackers});
}

/// @nodoc
class __$$BtConfigImplCopyWithImpl<$Res>
    extends _$BtConfigCopyWithImpl<$Res, _$BtConfigImpl>
    implements _$$BtConfigImplCopyWith<$Res> {
  __$$BtConfigImplCopyWithImpl(
      _$BtConfigImpl _value, $Res Function(_$BtConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of BtConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listenPort = null,
    Object? trackers = null,
  }) {
    return _then(_$BtConfigImpl(
      listenPort: null == listenPort
          ? _value.listenPort
          : listenPort // ignore: cast_nullable_to_non_nullable
              as int,
      trackers: null == trackers
          ? _value._trackers
          : trackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BtConfigImpl implements _BtConfig {
  const _$BtConfigImpl(
      {this.listenPort = 0, final List<String> trackers = const []})
      : _trackers = trackers;

  factory _$BtConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$BtConfigImplFromJson(json);

  @override
  @JsonKey()
  final int listenPort;
  final List<String> _trackers;
  @override
  @JsonKey()
  List<String> get trackers {
    if (_trackers is EqualUnmodifiableListView) return _trackers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackers);
  }

  @override
  String toString() {
    return 'BtConfig(listenPort: $listenPort, trackers: $trackers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BtConfigImpl &&
            (identical(other.listenPort, listenPort) ||
                other.listenPort == listenPort) &&
            const DeepCollectionEquality().equals(other._trackers, _trackers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, listenPort, const DeepCollectionEquality().hash(_trackers));

  /// Create a copy of BtConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BtConfigImplCopyWith<_$BtConfigImpl> get copyWith =>
      __$$BtConfigImplCopyWithImpl<_$BtConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BtConfigImplToJson(
      this,
    );
  }
}

abstract class _BtConfig implements BtConfig {
  const factory _BtConfig({final int listenPort, final List<String> trackers}) =
      _$BtConfigImpl;

  factory _BtConfig.fromJson(Map<String, dynamic> json) =
      _$BtConfigImpl.fromJson;

  @override
  int get listenPort;
  @override
  List<String> get trackers;

  /// Create a copy of BtConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BtConfigImplCopyWith<_$BtConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraConfig _$ExtraConfigFromJson(Map<String, dynamic> json) {
  return _ExtraConfig.fromJson(json);
}

/// @nodoc
mixin _$ExtraConfig {
  String get themeMode => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  bool get lastDeleteTaskKeep => throw _privateConstructorUsedError;
  ExtraConfigBt get bt => throw _privateConstructorUsedError;

  /// Serializes this ExtraConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtraConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtraConfigCopyWith<ExtraConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraConfigCopyWith<$Res> {
  factory $ExtraConfigCopyWith(
          ExtraConfig value, $Res Function(ExtraConfig) then) =
      _$ExtraConfigCopyWithImpl<$Res, ExtraConfig>;
  @useResult
  $Res call(
      {String themeMode,
      String locale,
      bool lastDeleteTaskKeep,
      ExtraConfigBt bt});

  $ExtraConfigBtCopyWith<$Res> get bt;
}

/// @nodoc
class _$ExtraConfigCopyWithImpl<$Res, $Val extends ExtraConfig>
    implements $ExtraConfigCopyWith<$Res> {
  _$ExtraConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtraConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? locale = null,
    Object? lastDeleteTaskKeep = null,
    Object? bt = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      lastDeleteTaskKeep: null == lastDeleteTaskKeep
          ? _value.lastDeleteTaskKeep
          : lastDeleteTaskKeep // ignore: cast_nullable_to_non_nullable
              as bool,
      bt: null == bt
          ? _value.bt
          : bt // ignore: cast_nullable_to_non_nullable
              as ExtraConfigBt,
    ) as $Val);
  }

  /// Create a copy of ExtraConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtraConfigBtCopyWith<$Res> get bt {
    return $ExtraConfigBtCopyWith<$Res>(_value.bt, (value) {
      return _then(_value.copyWith(bt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtraConfigImplCopyWith<$Res>
    implements $ExtraConfigCopyWith<$Res> {
  factory _$$ExtraConfigImplCopyWith(
          _$ExtraConfigImpl value, $Res Function(_$ExtraConfigImpl) then) =
      __$$ExtraConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String themeMode,
      String locale,
      bool lastDeleteTaskKeep,
      ExtraConfigBt bt});

  @override
  $ExtraConfigBtCopyWith<$Res> get bt;
}

/// @nodoc
class __$$ExtraConfigImplCopyWithImpl<$Res>
    extends _$ExtraConfigCopyWithImpl<$Res, _$ExtraConfigImpl>
    implements _$$ExtraConfigImplCopyWith<$Res> {
  __$$ExtraConfigImplCopyWithImpl(
      _$ExtraConfigImpl _value, $Res Function(_$ExtraConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtraConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? locale = null,
    Object? lastDeleteTaskKeep = null,
    Object? bt = null,
  }) {
    return _then(_$ExtraConfigImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      lastDeleteTaskKeep: null == lastDeleteTaskKeep
          ? _value.lastDeleteTaskKeep
          : lastDeleteTaskKeep // ignore: cast_nullable_to_non_nullable
              as bool,
      bt: null == bt
          ? _value.bt
          : bt // ignore: cast_nullable_to_non_nullable
              as ExtraConfigBt,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtraConfigImpl implements _ExtraConfig {
  const _$ExtraConfigImpl(
      {this.themeMode = '',
      this.locale = '',
      this.lastDeleteTaskKeep = false,
      this.bt = const ExtraConfigBt()});

  factory _$ExtraConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtraConfigImplFromJson(json);

  @override
  @JsonKey()
  final String themeMode;
  @override
  @JsonKey()
  final String locale;
  @override
  @JsonKey()
  final bool lastDeleteTaskKeep;
  @override
  @JsonKey()
  final ExtraConfigBt bt;

  @override
  String toString() {
    return 'ExtraConfig(themeMode: $themeMode, locale: $locale, lastDeleteTaskKeep: $lastDeleteTaskKeep, bt: $bt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraConfigImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.lastDeleteTaskKeep, lastDeleteTaskKeep) ||
                other.lastDeleteTaskKeep == lastDeleteTaskKeep) &&
            (identical(other.bt, bt) || other.bt == bt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, themeMode, locale, lastDeleteTaskKeep, bt);

  /// Create a copy of ExtraConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraConfigImplCopyWith<_$ExtraConfigImpl> get copyWith =>
      __$$ExtraConfigImplCopyWithImpl<_$ExtraConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtraConfigImplToJson(
      this,
    );
  }
}

abstract class _ExtraConfig implements ExtraConfig {
  const factory _ExtraConfig(
      {final String themeMode,
      final String locale,
      final bool lastDeleteTaskKeep,
      final ExtraConfigBt bt}) = _$ExtraConfigImpl;

  factory _ExtraConfig.fromJson(Map<String, dynamic> json) =
      _$ExtraConfigImpl.fromJson;

  @override
  String get themeMode;
  @override
  String get locale;
  @override
  bool get lastDeleteTaskKeep;
  @override
  ExtraConfigBt get bt;

  /// Create a copy of ExtraConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtraConfigImplCopyWith<_$ExtraConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProxyConfig _$ProxyConfigFromJson(Map<String, dynamic> json) {
  return _ProxyConfig.fromJson(json);
}

/// @nodoc
mixin _$ProxyConfig {
  bool get enable => throw _privateConstructorUsedError;
  bool get system => throw _privateConstructorUsedError;
  String get scheme => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String get usr => throw _privateConstructorUsedError;
  String get pwd => throw _privateConstructorUsedError;

  /// Serializes this ProxyConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProxyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProxyConfigCopyWith<ProxyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxyConfigCopyWith<$Res> {
  factory $ProxyConfigCopyWith(
          ProxyConfig value, $Res Function(ProxyConfig) then) =
      _$ProxyConfigCopyWithImpl<$Res, ProxyConfig>;
  @useResult
  $Res call(
      {bool enable,
      bool system,
      String scheme,
      String host,
      String usr,
      String pwd});
}

/// @nodoc
class _$ProxyConfigCopyWithImpl<$Res, $Val extends ProxyConfig>
    implements $ProxyConfigCopyWith<$Res> {
  _$ProxyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProxyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? system = null,
    Object? scheme = null,
    Object? host = null,
    Object? usr = null,
    Object? pwd = null,
  }) {
    return _then(_value.copyWith(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      system: null == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as bool,
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      usr: null == usr
          ? _value.usr
          : usr // ignore: cast_nullable_to_non_nullable
              as String,
      pwd: null == pwd
          ? _value.pwd
          : pwd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProxyConfigImplCopyWith<$Res>
    implements $ProxyConfigCopyWith<$Res> {
  factory _$$ProxyConfigImplCopyWith(
          _$ProxyConfigImpl value, $Res Function(_$ProxyConfigImpl) then) =
      __$$ProxyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enable,
      bool system,
      String scheme,
      String host,
      String usr,
      String pwd});
}

/// @nodoc
class __$$ProxyConfigImplCopyWithImpl<$Res>
    extends _$ProxyConfigCopyWithImpl<$Res, _$ProxyConfigImpl>
    implements _$$ProxyConfigImplCopyWith<$Res> {
  __$$ProxyConfigImplCopyWithImpl(
      _$ProxyConfigImpl _value, $Res Function(_$ProxyConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProxyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? system = null,
    Object? scheme = null,
    Object? host = null,
    Object? usr = null,
    Object? pwd = null,
  }) {
    return _then(_$ProxyConfigImpl(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      system: null == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as bool,
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      usr: null == usr
          ? _value.usr
          : usr // ignore: cast_nullable_to_non_nullable
              as String,
      pwd: null == pwd
          ? _value.pwd
          : pwd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProxyConfigImpl implements _ProxyConfig {
  const _$ProxyConfigImpl(
      {this.enable = false,
      this.system = false,
      this.scheme = '',
      this.host = '',
      this.usr = '',
      this.pwd = ''});

  factory _$ProxyConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProxyConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool enable;
  @override
  @JsonKey()
  final bool system;
  @override
  @JsonKey()
  final String scheme;
  @override
  @JsonKey()
  final String host;
  @override
  @JsonKey()
  final String usr;
  @override
  @JsonKey()
  final String pwd;

  @override
  String toString() {
    return 'ProxyConfig(enable: $enable, system: $system, scheme: $scheme, host: $host, usr: $usr, pwd: $pwd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProxyConfigImpl &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.scheme, scheme) || other.scheme == scheme) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.usr, usr) || other.usr == usr) &&
            (identical(other.pwd, pwd) || other.pwd == pwd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enable, system, scheme, host, usr, pwd);

  /// Create a copy of ProxyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProxyConfigImplCopyWith<_$ProxyConfigImpl> get copyWith =>
      __$$ProxyConfigImplCopyWithImpl<_$ProxyConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProxyConfigImplToJson(
      this,
    );
  }
}

abstract class _ProxyConfig implements ProxyConfig {
  const factory _ProxyConfig(
      {final bool enable,
      final bool system,
      final String scheme,
      final String host,
      final String usr,
      final String pwd}) = _$ProxyConfigImpl;

  factory _ProxyConfig.fromJson(Map<String, dynamic> json) =
      _$ProxyConfigImpl.fromJson;

  @override
  bool get enable;
  @override
  bool get system;
  @override
  String get scheme;
  @override
  String get host;
  @override
  String get usr;
  @override
  String get pwd;

  /// Create a copy of ProxyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProxyConfigImplCopyWith<_$ProxyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraConfigBt _$ExtraConfigBtFromJson(Map<String, dynamic> json) {
  return _ExtraConfigBt.fromJson(json);
}

/// @nodoc
mixin _$ExtraConfigBt {
  List<String> get trackerSubscribeUrls => throw _privateConstructorUsedError;
  List<String> get subscribeTrackers => throw _privateConstructorUsedError;
  bool get autoUpdateTrackers => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_tracker_update_time')
  String? get lastTrackerUpdateTime => throw _privateConstructorUsedError;
  List<String> get customTrackers => throw _privateConstructorUsedError;

  /// Serializes this ExtraConfigBt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtraConfigBt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtraConfigBtCopyWith<ExtraConfigBt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraConfigBtCopyWith<$Res> {
  factory $ExtraConfigBtCopyWith(
          ExtraConfigBt value, $Res Function(ExtraConfigBt) then) =
      _$ExtraConfigBtCopyWithImpl<$Res, ExtraConfigBt>;
  @useResult
  $Res call(
      {List<String> trackerSubscribeUrls,
      List<String> subscribeTrackers,
      bool autoUpdateTrackers,
      @JsonKey(name: 'last_tracker_update_time') String? lastTrackerUpdateTime,
      List<String> customTrackers});
}

/// @nodoc
class _$ExtraConfigBtCopyWithImpl<$Res, $Val extends ExtraConfigBt>
    implements $ExtraConfigBtCopyWith<$Res> {
  _$ExtraConfigBtCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtraConfigBt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackerSubscribeUrls = null,
    Object? subscribeTrackers = null,
    Object? autoUpdateTrackers = null,
    Object? lastTrackerUpdateTime = freezed,
    Object? customTrackers = null,
  }) {
    return _then(_value.copyWith(
      trackerSubscribeUrls: null == trackerSubscribeUrls
          ? _value.trackerSubscribeUrls
          : trackerSubscribeUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subscribeTrackers: null == subscribeTrackers
          ? _value.subscribeTrackers
          : subscribeTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      autoUpdateTrackers: null == autoUpdateTrackers
          ? _value.autoUpdateTrackers
          : autoUpdateTrackers // ignore: cast_nullable_to_non_nullable
              as bool,
      lastTrackerUpdateTime: freezed == lastTrackerUpdateTime
          ? _value.lastTrackerUpdateTime
          : lastTrackerUpdateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      customTrackers: null == customTrackers
          ? _value.customTrackers
          : customTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtraConfigBtImplCopyWith<$Res>
    implements $ExtraConfigBtCopyWith<$Res> {
  factory _$$ExtraConfigBtImplCopyWith(
          _$ExtraConfigBtImpl value, $Res Function(_$ExtraConfigBtImpl) then) =
      __$$ExtraConfigBtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> trackerSubscribeUrls,
      List<String> subscribeTrackers,
      bool autoUpdateTrackers,
      @JsonKey(name: 'last_tracker_update_time') String? lastTrackerUpdateTime,
      List<String> customTrackers});
}

/// @nodoc
class __$$ExtraConfigBtImplCopyWithImpl<$Res>
    extends _$ExtraConfigBtCopyWithImpl<$Res, _$ExtraConfigBtImpl>
    implements _$$ExtraConfigBtImplCopyWith<$Res> {
  __$$ExtraConfigBtImplCopyWithImpl(
      _$ExtraConfigBtImpl _value, $Res Function(_$ExtraConfigBtImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtraConfigBt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackerSubscribeUrls = null,
    Object? subscribeTrackers = null,
    Object? autoUpdateTrackers = null,
    Object? lastTrackerUpdateTime = freezed,
    Object? customTrackers = null,
  }) {
    return _then(_$ExtraConfigBtImpl(
      trackerSubscribeUrls: null == trackerSubscribeUrls
          ? _value._trackerSubscribeUrls
          : trackerSubscribeUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subscribeTrackers: null == subscribeTrackers
          ? _value._subscribeTrackers
          : subscribeTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      autoUpdateTrackers: null == autoUpdateTrackers
          ? _value.autoUpdateTrackers
          : autoUpdateTrackers // ignore: cast_nullable_to_non_nullable
              as bool,
      lastTrackerUpdateTime: freezed == lastTrackerUpdateTime
          ? _value.lastTrackerUpdateTime
          : lastTrackerUpdateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      customTrackers: null == customTrackers
          ? _value._customTrackers
          : customTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtraConfigBtImpl extends _ExtraConfigBt {
  const _$ExtraConfigBtImpl(
      {final List<String> trackerSubscribeUrls = const [],
      final List<String> subscribeTrackers = const [],
      this.autoUpdateTrackers = true,
      @JsonKey(name: 'last_tracker_update_time') this.lastTrackerUpdateTime,
      final List<String> customTrackers = const []})
      : _trackerSubscribeUrls = trackerSubscribeUrls,
        _subscribeTrackers = subscribeTrackers,
        _customTrackers = customTrackers,
        super._();

  factory _$ExtraConfigBtImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtraConfigBtImplFromJson(json);

  final List<String> _trackerSubscribeUrls;
  @override
  @JsonKey()
  List<String> get trackerSubscribeUrls {
    if (_trackerSubscribeUrls is EqualUnmodifiableListView)
      return _trackerSubscribeUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackerSubscribeUrls);
  }

  final List<String> _subscribeTrackers;
  @override
  @JsonKey()
  List<String> get subscribeTrackers {
    if (_subscribeTrackers is EqualUnmodifiableListView)
      return _subscribeTrackers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscribeTrackers);
  }

  @override
  @JsonKey()
  final bool autoUpdateTrackers;
  @override
  @JsonKey(name: 'last_tracker_update_time')
  final String? lastTrackerUpdateTime;
  final List<String> _customTrackers;
  @override
  @JsonKey()
  List<String> get customTrackers {
    if (_customTrackers is EqualUnmodifiableListView) return _customTrackers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customTrackers);
  }

  @override
  String toString() {
    return 'ExtraConfigBt(trackerSubscribeUrls: $trackerSubscribeUrls, subscribeTrackers: $subscribeTrackers, autoUpdateTrackers: $autoUpdateTrackers, lastTrackerUpdateTime: $lastTrackerUpdateTime, customTrackers: $customTrackers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraConfigBtImpl &&
            const DeepCollectionEquality()
                .equals(other._trackerSubscribeUrls, _trackerSubscribeUrls) &&
            const DeepCollectionEquality()
                .equals(other._subscribeTrackers, _subscribeTrackers) &&
            (identical(other.autoUpdateTrackers, autoUpdateTrackers) ||
                other.autoUpdateTrackers == autoUpdateTrackers) &&
            (identical(other.lastTrackerUpdateTime, lastTrackerUpdateTime) ||
                other.lastTrackerUpdateTime == lastTrackerUpdateTime) &&
            const DeepCollectionEquality()
                .equals(other._customTrackers, _customTrackers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trackerSubscribeUrls),
      const DeepCollectionEquality().hash(_subscribeTrackers),
      autoUpdateTrackers,
      lastTrackerUpdateTime,
      const DeepCollectionEquality().hash(_customTrackers));

  /// Create a copy of ExtraConfigBt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraConfigBtImplCopyWith<_$ExtraConfigBtImpl> get copyWith =>
      __$$ExtraConfigBtImplCopyWithImpl<_$ExtraConfigBtImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtraConfigBtImplToJson(
      this,
    );
  }
}

abstract class _ExtraConfigBt extends ExtraConfigBt {
  const factory _ExtraConfigBt(
      {final List<String> trackerSubscribeUrls,
      final List<String> subscribeTrackers,
      final bool autoUpdateTrackers,
      @JsonKey(name: 'last_tracker_update_time')
      final String? lastTrackerUpdateTime,
      final List<String> customTrackers}) = _$ExtraConfigBtImpl;
  const _ExtraConfigBt._() : super._();

  factory _ExtraConfigBt.fromJson(Map<String, dynamic> json) =
      _$ExtraConfigBtImpl.fromJson;

  @override
  List<String> get trackerSubscribeUrls;
  @override
  List<String> get subscribeTrackers;
  @override
  bool get autoUpdateTrackers;
  @override
  @JsonKey(name: 'last_tracker_update_time')
  String? get lastTrackerUpdateTime;
  @override
  List<String> get customTrackers;

  /// Create a copy of ExtraConfigBt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtraConfigBtImplCopyWith<_$ExtraConfigBtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
