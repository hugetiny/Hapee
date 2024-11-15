// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerInfo _$ServerInfoFromJson(Map<String, dynamic> json) {
  return _ServerInfo.fromJson(json);
}

/// @nodoc
mixin _$ServerInfo {
  String get version => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  String get arch => throw _privateConstructorUsedError;
  String get goVersion => throw _privateConstructorUsedError;
  String get gitHash => throw _privateConstructorUsedError;
  String get buildTime => throw _privateConstructorUsedError;

  /// Serializes this ServerInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServerInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerInfoCopyWith<ServerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerInfoCopyWith<$Res> {
  factory $ServerInfoCopyWith(
          ServerInfo value, $Res Function(ServerInfo) then) =
      _$ServerInfoCopyWithImpl<$Res, ServerInfo>;
  @useResult
  $Res call(
      {String version,
      String os,
      String arch,
      String goVersion,
      String gitHash,
      String buildTime});
}

/// @nodoc
class _$ServerInfoCopyWithImpl<$Res, $Val extends ServerInfo>
    implements $ServerInfoCopyWith<$Res> {
  _$ServerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? os = null,
    Object? arch = null,
    Object? goVersion = null,
    Object? gitHash = null,
    Object? buildTime = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as String,
      goVersion: null == goVersion
          ? _value.goVersion
          : goVersion // ignore: cast_nullable_to_non_nullable
              as String,
      gitHash: null == gitHash
          ? _value.gitHash
          : gitHash // ignore: cast_nullable_to_non_nullable
              as String,
      buildTime: null == buildTime
          ? _value.buildTime
          : buildTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerInfoImplCopyWith<$Res>
    implements $ServerInfoCopyWith<$Res> {
  factory _$$ServerInfoImplCopyWith(
          _$ServerInfoImpl value, $Res Function(_$ServerInfoImpl) then) =
      __$$ServerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      String os,
      String arch,
      String goVersion,
      String gitHash,
      String buildTime});
}

/// @nodoc
class __$$ServerInfoImplCopyWithImpl<$Res>
    extends _$ServerInfoCopyWithImpl<$Res, _$ServerInfoImpl>
    implements _$$ServerInfoImplCopyWith<$Res> {
  __$$ServerInfoImplCopyWithImpl(
      _$ServerInfoImpl _value, $Res Function(_$ServerInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? os = null,
    Object? arch = null,
    Object? goVersion = null,
    Object? gitHash = null,
    Object? buildTime = null,
  }) {
    return _then(_$ServerInfoImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as String,
      goVersion: null == goVersion
          ? _value.goVersion
          : goVersion // ignore: cast_nullable_to_non_nullable
              as String,
      gitHash: null == gitHash
          ? _value.gitHash
          : gitHash // ignore: cast_nullable_to_non_nullable
              as String,
      buildTime: null == buildTime
          ? _value.buildTime
          : buildTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerInfoImpl implements _ServerInfo {
  const _$ServerInfoImpl(
      {required this.version,
      required this.os,
      required this.arch,
      required this.goVersion,
      required this.gitHash,
      required this.buildTime});

  factory _$ServerInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerInfoImplFromJson(json);

  @override
  final String version;
  @override
  final String os;
  @override
  final String arch;
  @override
  final String goVersion;
  @override
  final String gitHash;
  @override
  final String buildTime;

  @override
  String toString() {
    return 'ServerInfo(version: $version, os: $os, arch: $arch, goVersion: $goVersion, gitHash: $gitHash, buildTime: $buildTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerInfoImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.arch, arch) || other.arch == arch) &&
            (identical(other.goVersion, goVersion) ||
                other.goVersion == goVersion) &&
            (identical(other.gitHash, gitHash) || other.gitHash == gitHash) &&
            (identical(other.buildTime, buildTime) ||
                other.buildTime == buildTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, os, arch, goVersion, gitHash, buildTime);

  /// Create a copy of ServerInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerInfoImplCopyWith<_$ServerInfoImpl> get copyWith =>
      __$$ServerInfoImplCopyWithImpl<_$ServerInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerInfoImplToJson(
      this,
    );
  }
}

abstract class _ServerInfo implements ServerInfo {
  const factory _ServerInfo(
      {required final String version,
      required final String os,
      required final String arch,
      required final String goVersion,
      required final String gitHash,
      required final String buildTime}) = _$ServerInfoImpl;

  factory _ServerInfo.fromJson(Map<String, dynamic> json) =
      _$ServerInfoImpl.fromJson;

  @override
  String get version;
  @override
  String get os;
  @override
  String get arch;
  @override
  String get goVersion;
  @override
  String get gitHash;
  @override
  String get buildTime;

  /// Create a copy of ServerInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerInfoImplCopyWith<_$ServerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
