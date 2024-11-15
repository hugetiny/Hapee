// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Request _$RequestFromJson(Map<String, dynamic> json) {
  return _Request.fromJson(json);
}

/// @nodoc
mixin _$Request {
  String get url => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extra => throw _privateConstructorUsedError;
  Map<String, String>? get labels => throw _privateConstructorUsedError;

  /// Serializes this Request to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res, Request>;
  @useResult
  $Res call(
      {String url, Map<String, dynamic>? extra, Map<String, String>? labels});
}

/// @nodoc
class _$RequestCopyWithImpl<$Res, $Val extends Request>
    implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? extra = freezed,
    Object? labels = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestImplCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$$RequestImplCopyWith(
          _$RequestImpl value, $Res Function(_$RequestImpl) then) =
      __$$RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url, Map<String, dynamic>? extra, Map<String, String>? labels});
}

/// @nodoc
class __$$RequestImplCopyWithImpl<$Res>
    extends _$RequestCopyWithImpl<$Res, _$RequestImpl>
    implements _$$RequestImplCopyWith<$Res> {
  __$$RequestImplCopyWithImpl(
      _$RequestImpl _value, $Res Function(_$RequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? extra = freezed,
    Object? labels = freezed,
  }) {
    return _then(_$RequestImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestImpl implements _Request {
  const _$RequestImpl(
      {required this.url,
      final Map<String, dynamic>? extra,
      final Map<String, String>? labels})
      : _extra = extra,
        _labels = labels;

  factory _$RequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestImplFromJson(json);

  @override
  final String url;
  final Map<String, dynamic>? _extra;
  @override
  Map<String, dynamic>? get extra {
    final value = _extra;
    if (value == null) return null;
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, String>? _labels;
  @override
  Map<String, String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableMapView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Request(url: $url, extra: $extra, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestImpl &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      const DeepCollectionEquality().hash(_extra),
      const DeepCollectionEquality().hash(_labels));

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      __$$RequestImplCopyWithImpl<_$RequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestImplToJson(
      this,
    );
  }
}

abstract class _Request implements Request {
  const factory _Request(
      {required final String url,
      final Map<String, dynamic>? extra,
      final Map<String, String>? labels}) = _$RequestImpl;

  factory _Request.fromJson(Map<String, dynamic> json) = _$RequestImpl.fromJson;

  @override
  String get url;
  @override
  Map<String, dynamic>? get extra;
  @override
  Map<String, String>? get labels;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReqExtraHttp _$ReqExtraHttpFromJson(Map<String, dynamic> json) {
  return _ReqExtraHttp.fromJson(json);
}

/// @nodoc
mixin _$ReqExtraHttp {
  String get method => throw _privateConstructorUsedError;
  Map<String, String> get header => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  /// Serializes this ReqExtraHttp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReqExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqExtraHttpCopyWith<ReqExtraHttp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqExtraHttpCopyWith<$Res> {
  factory $ReqExtraHttpCopyWith(
          ReqExtraHttp value, $Res Function(ReqExtraHttp) then) =
      _$ReqExtraHttpCopyWithImpl<$Res, ReqExtraHttp>;
  @useResult
  $Res call({String method, Map<String, String> header, String body});
}

/// @nodoc
class _$ReqExtraHttpCopyWithImpl<$Res, $Val extends ReqExtraHttp>
    implements $ReqExtraHttpCopyWith<$Res> {
  _$ReqExtraHttpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReqExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? header = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqExtraHttpImplCopyWith<$Res>
    implements $ReqExtraHttpCopyWith<$Res> {
  factory _$$ReqExtraHttpImplCopyWith(
          _$ReqExtraHttpImpl value, $Res Function(_$ReqExtraHttpImpl) then) =
      __$$ReqExtraHttpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String method, Map<String, String> header, String body});
}

/// @nodoc
class __$$ReqExtraHttpImplCopyWithImpl<$Res>
    extends _$ReqExtraHttpCopyWithImpl<$Res, _$ReqExtraHttpImpl>
    implements _$$ReqExtraHttpImplCopyWith<$Res> {
  __$$ReqExtraHttpImplCopyWithImpl(
      _$ReqExtraHttpImpl _value, $Res Function(_$ReqExtraHttpImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReqExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? header = null,
    Object? body = null,
  }) {
    return _then(_$ReqExtraHttpImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqExtraHttpImpl implements _ReqExtraHttp {
  const _$ReqExtraHttpImpl(
      {this.method = 'GET',
      final Map<String, String> header = const {},
      this.body = ''})
      : _header = header;

  factory _$ReqExtraHttpImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqExtraHttpImplFromJson(json);

  @override
  @JsonKey()
  final String method;
  final Map<String, String> _header;
  @override
  @JsonKey()
  Map<String, String> get header {
    if (_header is EqualUnmodifiableMapView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_header);
  }

  @override
  @JsonKey()
  final String body;

  @override
  String toString() {
    return 'ReqExtraHttp(method: $method, header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqExtraHttpImpl &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._header, _header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, method, const DeepCollectionEquality().hash(_header), body);

  /// Create a copy of ReqExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqExtraHttpImplCopyWith<_$ReqExtraHttpImpl> get copyWith =>
      __$$ReqExtraHttpImplCopyWithImpl<_$ReqExtraHttpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqExtraHttpImplToJson(
      this,
    );
  }
}

abstract class _ReqExtraHttp implements ReqExtraHttp {
  const factory _ReqExtraHttp(
      {final String method,
      final Map<String, String> header,
      final String body}) = _$ReqExtraHttpImpl;

  factory _ReqExtraHttp.fromJson(Map<String, dynamic> json) =
      _$ReqExtraHttpImpl.fromJson;

  @override
  String get method;
  @override
  Map<String, String> get header;
  @override
  String get body;

  /// Create a copy of ReqExtraHttp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqExtraHttpImplCopyWith<_$ReqExtraHttpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReqExtraBt _$ReqExtraBtFromJson(Map<String, dynamic> json) {
  return _ReqExtraBt.fromJson(json);
}

/// @nodoc
mixin _$ReqExtraBt {
  List<String> get trackers => throw _privateConstructorUsedError;

  /// Serializes this ReqExtraBt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReqExtraBt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqExtraBtCopyWith<ReqExtraBt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqExtraBtCopyWith<$Res> {
  factory $ReqExtraBtCopyWith(
          ReqExtraBt value, $Res Function(ReqExtraBt) then) =
      _$ReqExtraBtCopyWithImpl<$Res, ReqExtraBt>;
  @useResult
  $Res call({List<String> trackers});
}

/// @nodoc
class _$ReqExtraBtCopyWithImpl<$Res, $Val extends ReqExtraBt>
    implements $ReqExtraBtCopyWith<$Res> {
  _$ReqExtraBtCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReqExtraBt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackers = null,
  }) {
    return _then(_value.copyWith(
      trackers: null == trackers
          ? _value.trackers
          : trackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqExtraBtImplCopyWith<$Res>
    implements $ReqExtraBtCopyWith<$Res> {
  factory _$$ReqExtraBtImplCopyWith(
          _$ReqExtraBtImpl value, $Res Function(_$ReqExtraBtImpl) then) =
      __$$ReqExtraBtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> trackers});
}

/// @nodoc
class __$$ReqExtraBtImplCopyWithImpl<$Res>
    extends _$ReqExtraBtCopyWithImpl<$Res, _$ReqExtraBtImpl>
    implements _$$ReqExtraBtImplCopyWith<$Res> {
  __$$ReqExtraBtImplCopyWithImpl(
      _$ReqExtraBtImpl _value, $Res Function(_$ReqExtraBtImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReqExtraBt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackers = null,
  }) {
    return _then(_$ReqExtraBtImpl(
      trackers: null == trackers
          ? _value._trackers
          : trackers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqExtraBtImpl implements _ReqExtraBt {
  const _$ReqExtraBtImpl({final List<String> trackers = const []})
      : _trackers = trackers;

  factory _$ReqExtraBtImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqExtraBtImplFromJson(json);

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
    return 'ReqExtraBt(trackers: $trackers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqExtraBtImpl &&
            const DeepCollectionEquality().equals(other._trackers, _trackers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_trackers));

  /// Create a copy of ReqExtraBt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqExtraBtImplCopyWith<_$ReqExtraBtImpl> get copyWith =>
      __$$ReqExtraBtImplCopyWithImpl<_$ReqExtraBtImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqExtraBtImplToJson(
      this,
    );
  }
}

abstract class _ReqExtraBt implements ReqExtraBt {
  const factory _ReqExtraBt({final List<String> trackers}) = _$ReqExtraBtImpl;

  factory _ReqExtraBt.fromJson(Map<String, dynamic> json) =
      _$ReqExtraBtImpl.fromJson;

  @override
  List<String> get trackers;

  /// Create a copy of ReqExtraBt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqExtraBtImplCopyWith<_$ReqExtraBtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
