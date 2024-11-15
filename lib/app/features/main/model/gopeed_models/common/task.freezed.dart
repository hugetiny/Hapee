// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Progress get progress => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  Protocol? get protocol => throw _privateConstructorUsedError;
  bool get uploading => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      Meta meta,
      Status status,
      Progress progress,
      String createdAt,
      String updatedAt,
      Protocol? protocol,
      bool uploading,
      int? size});

  $MetaCopyWith<$Res> get meta;
  $ProgressCopyWith<$Res> get progress;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meta = null,
    Object? status = null,
    Object? progress = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? protocol = freezed,
    Object? uploading = null,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Progress,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: freezed == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as Protocol?,
      uploading: null == uploading
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgressCopyWith<$Res> get progress {
    return $ProgressCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Meta meta,
      Status status,
      Progress progress,
      String createdAt,
      String updatedAt,
      Protocol? protocol,
      bool uploading,
      int? size});

  @override
  $MetaCopyWith<$Res> get meta;
  @override
  $ProgressCopyWith<$Res> get progress;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meta = null,
    Object? status = null,
    Object? progress = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? protocol = freezed,
    Object? uploading = null,
    Object? size = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Progress,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: freezed == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as Protocol?,
      uploading: null == uploading
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {required this.id,
      required this.meta,
      required this.status,
      required this.progress,
      required this.createdAt,
      required this.updatedAt,
      this.protocol,
      this.uploading = false,
      this.size})
      : super._();

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final Meta meta;
  @override
  final Status status;
  @override
  final Progress progress;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final Protocol? protocol;
  @override
  @JsonKey()
  final bool uploading;
  @override
  final int? size;

  @override
  String toString() {
    return 'Task(id: $id, meta: $meta, status: $status, progress: $progress, createdAt: $createdAt, updatedAt: $updatedAt, protocol: $protocol, uploading: $uploading, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.uploading, uploading) ||
                other.uploading == uploading) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, meta, status, progress,
      createdAt, updatedAt, protocol, uploading, size);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task extends Task {
  const factory _Task(
      {required final String id,
      required final Meta meta,
      required final Status status,
      required final Progress progress,
      required final String createdAt,
      required final String updatedAt,
      final Protocol? protocol,
      final bool uploading,
      final int? size}) = _$TaskImpl;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  Meta get meta;
  @override
  Status get status;
  @override
  Progress get progress;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  Protocol? get protocol;
  @override
  bool get uploading;
  @override
  int? get size;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskBtStats _$TaskBtStatsFromJson(Map<String, dynamic> json) {
  return _TaskBtStats.fromJson(json);
}

/// @nodoc
mixin _$TaskBtStats {
  int get downloadSpeed => throw _privateConstructorUsedError;
  int get uploadSpeed => throw _privateConstructorUsedError;
  int get downloaded => throw _privateConstructorUsedError;
  int get uploaded => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  int get connectedPeers => throw _privateConstructorUsedError;
  int get connectedSeeds => throw _privateConstructorUsedError;
  int get totalPeers => throw _privateConstructorUsedError;
  int get totalSeeds => throw _privateConstructorUsedError;

  /// Serializes this TaskBtStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskBtStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskBtStatsCopyWith<TaskBtStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskBtStatsCopyWith<$Res> {
  factory $TaskBtStatsCopyWith(
          TaskBtStats value, $Res Function(TaskBtStats) then) =
      _$TaskBtStatsCopyWithImpl<$Res, TaskBtStats>;
  @useResult
  $Res call(
      {int downloadSpeed,
      int uploadSpeed,
      int downloaded,
      int uploaded,
      int progress,
      int connectedPeers,
      int connectedSeeds,
      int totalPeers,
      int totalSeeds});
}

/// @nodoc
class _$TaskBtStatsCopyWithImpl<$Res, $Val extends TaskBtStats>
    implements $TaskBtStatsCopyWith<$Res> {
  _$TaskBtStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskBtStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadSpeed = null,
    Object? uploadSpeed = null,
    Object? downloaded = null,
    Object? uploaded = null,
    Object? progress = null,
    Object? connectedPeers = null,
    Object? connectedSeeds = null,
    Object? totalPeers = null,
    Object? totalSeeds = null,
  }) {
    return _then(_value.copyWith(
      downloadSpeed: null == downloadSpeed
          ? _value.downloadSpeed
          : downloadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      uploadSpeed: null == uploadSpeed
          ? _value.uploadSpeed
          : uploadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      downloaded: null == downloaded
          ? _value.downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as int,
      uploaded: null == uploaded
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      connectedPeers: null == connectedPeers
          ? _value.connectedPeers
          : connectedPeers // ignore: cast_nullable_to_non_nullable
              as int,
      connectedSeeds: null == connectedSeeds
          ? _value.connectedSeeds
          : connectedSeeds // ignore: cast_nullable_to_non_nullable
              as int,
      totalPeers: null == totalPeers
          ? _value.totalPeers
          : totalPeers // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeeds: null == totalSeeds
          ? _value.totalSeeds
          : totalSeeds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskBtStatsImplCopyWith<$Res>
    implements $TaskBtStatsCopyWith<$Res> {
  factory _$$TaskBtStatsImplCopyWith(
          _$TaskBtStatsImpl value, $Res Function(_$TaskBtStatsImpl) then) =
      __$$TaskBtStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int downloadSpeed,
      int uploadSpeed,
      int downloaded,
      int uploaded,
      int progress,
      int connectedPeers,
      int connectedSeeds,
      int totalPeers,
      int totalSeeds});
}

/// @nodoc
class __$$TaskBtStatsImplCopyWithImpl<$Res>
    extends _$TaskBtStatsCopyWithImpl<$Res, _$TaskBtStatsImpl>
    implements _$$TaskBtStatsImplCopyWith<$Res> {
  __$$TaskBtStatsImplCopyWithImpl(
      _$TaskBtStatsImpl _value, $Res Function(_$TaskBtStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskBtStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadSpeed = null,
    Object? uploadSpeed = null,
    Object? downloaded = null,
    Object? uploaded = null,
    Object? progress = null,
    Object? connectedPeers = null,
    Object? connectedSeeds = null,
    Object? totalPeers = null,
    Object? totalSeeds = null,
  }) {
    return _then(_$TaskBtStatsImpl(
      downloadSpeed: null == downloadSpeed
          ? _value.downloadSpeed
          : downloadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      uploadSpeed: null == uploadSpeed
          ? _value.uploadSpeed
          : uploadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      downloaded: null == downloaded
          ? _value.downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as int,
      uploaded: null == uploaded
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      connectedPeers: null == connectedPeers
          ? _value.connectedPeers
          : connectedPeers // ignore: cast_nullable_to_non_nullable
              as int,
      connectedSeeds: null == connectedSeeds
          ? _value.connectedSeeds
          : connectedSeeds // ignore: cast_nullable_to_non_nullable
              as int,
      totalPeers: null == totalPeers
          ? _value.totalPeers
          : totalPeers // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeeds: null == totalSeeds
          ? _value.totalSeeds
          : totalSeeds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskBtStatsImpl implements _TaskBtStats {
  const _$TaskBtStatsImpl(
      {this.downloadSpeed = 0,
      this.uploadSpeed = 0,
      this.downloaded = 0,
      this.uploaded = 0,
      this.progress = 0,
      this.connectedPeers = 0,
      this.connectedSeeds = 0,
      this.totalPeers = 0,
      this.totalSeeds = 0});

  factory _$TaskBtStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskBtStatsImplFromJson(json);

  @override
  @JsonKey()
  final int downloadSpeed;
  @override
  @JsonKey()
  final int uploadSpeed;
  @override
  @JsonKey()
  final int downloaded;
  @override
  @JsonKey()
  final int uploaded;
  @override
  @JsonKey()
  final int progress;
  @override
  @JsonKey()
  final int connectedPeers;
  @override
  @JsonKey()
  final int connectedSeeds;
  @override
  @JsonKey()
  final int totalPeers;
  @override
  @JsonKey()
  final int totalSeeds;

  @override
  String toString() {
    return 'TaskBtStats(downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, downloaded: $downloaded, uploaded: $uploaded, progress: $progress, connectedPeers: $connectedPeers, connectedSeeds: $connectedSeeds, totalPeers: $totalPeers, totalSeeds: $totalSeeds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskBtStatsImpl &&
            (identical(other.downloadSpeed, downloadSpeed) ||
                other.downloadSpeed == downloadSpeed) &&
            (identical(other.uploadSpeed, uploadSpeed) ||
                other.uploadSpeed == uploadSpeed) &&
            (identical(other.downloaded, downloaded) ||
                other.downloaded == downloaded) &&
            (identical(other.uploaded, uploaded) ||
                other.uploaded == uploaded) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.connectedPeers, connectedPeers) ||
                other.connectedPeers == connectedPeers) &&
            (identical(other.connectedSeeds, connectedSeeds) ||
                other.connectedSeeds == connectedSeeds) &&
            (identical(other.totalPeers, totalPeers) ||
                other.totalPeers == totalPeers) &&
            (identical(other.totalSeeds, totalSeeds) ||
                other.totalSeeds == totalSeeds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      downloadSpeed,
      uploadSpeed,
      downloaded,
      uploaded,
      progress,
      connectedPeers,
      connectedSeeds,
      totalPeers,
      totalSeeds);

  /// Create a copy of TaskBtStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskBtStatsImplCopyWith<_$TaskBtStatsImpl> get copyWith =>
      __$$TaskBtStatsImplCopyWithImpl<_$TaskBtStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskBtStatsImplToJson(
      this,
    );
  }
}

abstract class _TaskBtStats implements TaskBtStats {
  const factory _TaskBtStats(
      {final int downloadSpeed,
      final int uploadSpeed,
      final int downloaded,
      final int uploaded,
      final int progress,
      final int connectedPeers,
      final int connectedSeeds,
      final int totalPeers,
      final int totalSeeds}) = _$TaskBtStatsImpl;

  factory _TaskBtStats.fromJson(Map<String, dynamic> json) =
      _$TaskBtStatsImpl.fromJson;

  @override
  int get downloadSpeed;
  @override
  int get uploadSpeed;
  @override
  int get downloaded;
  @override
  int get uploaded;
  @override
  int get progress;
  @override
  int get connectedPeers;
  @override
  int get connectedSeeds;
  @override
  int get totalPeers;
  @override
  int get totalSeeds;

  /// Create a copy of TaskBtStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskBtStatsImplCopyWith<_$TaskBtStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTaskBatch _$CreateTaskBatchFromJson(Map<String, dynamic> json) {
  return _CreateTaskBatch.fromJson(json);
}

/// @nodoc
mixin _$CreateTaskBatch {
  List<Request> get reqs => throw _privateConstructorUsedError;
  Options? get opt => throw _privateConstructorUsedError;

  /// Serializes this CreateTaskBatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTaskBatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTaskBatchCopyWith<CreateTaskBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskBatchCopyWith<$Res> {
  factory $CreateTaskBatchCopyWith(
          CreateTaskBatch value, $Res Function(CreateTaskBatch) then) =
      _$CreateTaskBatchCopyWithImpl<$Res, CreateTaskBatch>;
  @useResult
  $Res call({List<Request> reqs, Options? opt});

  $OptionsCopyWith<$Res>? get opt;
}

/// @nodoc
class _$CreateTaskBatchCopyWithImpl<$Res, $Val extends CreateTaskBatch>
    implements $CreateTaskBatchCopyWith<$Res> {
  _$CreateTaskBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTaskBatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqs = null,
    Object? opt = freezed,
  }) {
    return _then(_value.copyWith(
      reqs: null == reqs
          ? _value.reqs
          : reqs // ignore: cast_nullable_to_non_nullable
              as List<Request>,
      opt: freezed == opt
          ? _value.opt
          : opt // ignore: cast_nullable_to_non_nullable
              as Options?,
    ) as $Val);
  }

  /// Create a copy of CreateTaskBatch
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
abstract class _$$CreateTaskBatchImplCopyWith<$Res>
    implements $CreateTaskBatchCopyWith<$Res> {
  factory _$$CreateTaskBatchImplCopyWith(_$CreateTaskBatchImpl value,
          $Res Function(_$CreateTaskBatchImpl) then) =
      __$$CreateTaskBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Request> reqs, Options? opt});

  @override
  $OptionsCopyWith<$Res>? get opt;
}

/// @nodoc
class __$$CreateTaskBatchImplCopyWithImpl<$Res>
    extends _$CreateTaskBatchCopyWithImpl<$Res, _$CreateTaskBatchImpl>
    implements _$$CreateTaskBatchImplCopyWith<$Res> {
  __$$CreateTaskBatchImplCopyWithImpl(
      _$CreateTaskBatchImpl _value, $Res Function(_$CreateTaskBatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTaskBatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqs = null,
    Object? opt = freezed,
  }) {
    return _then(_$CreateTaskBatchImpl(
      reqs: null == reqs
          ? _value._reqs
          : reqs // ignore: cast_nullable_to_non_nullable
              as List<Request>,
      opt: freezed == opt
          ? _value.opt
          : opt // ignore: cast_nullable_to_non_nullable
              as Options?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTaskBatchImpl implements _CreateTaskBatch {
  const _$CreateTaskBatchImpl({required final List<Request> reqs, this.opt})
      : _reqs = reqs;

  factory _$CreateTaskBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTaskBatchImplFromJson(json);

  final List<Request> _reqs;
  @override
  List<Request> get reqs {
    if (_reqs is EqualUnmodifiableListView) return _reqs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reqs);
  }

  @override
  final Options? opt;

  @override
  String toString() {
    return 'CreateTaskBatch(reqs: $reqs, opt: $opt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskBatchImpl &&
            const DeepCollectionEquality().equals(other._reqs, _reqs) &&
            (identical(other.opt, opt) || other.opt == opt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reqs), opt);

  /// Create a copy of CreateTaskBatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskBatchImplCopyWith<_$CreateTaskBatchImpl> get copyWith =>
      __$$CreateTaskBatchImplCopyWithImpl<_$CreateTaskBatchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTaskBatchImplToJson(
      this,
    );
  }
}

abstract class _CreateTaskBatch implements CreateTaskBatch {
  const factory _CreateTaskBatch(
      {required final List<Request> reqs,
      final Options? opt}) = _$CreateTaskBatchImpl;

  factory _CreateTaskBatch.fromJson(Map<String, dynamic> json) =
      _$CreateTaskBatchImpl.fromJson;

  @override
  List<Request> get reqs;
  @override
  Options? get opt;

  /// Create a copy of CreateTaskBatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTaskBatchImplCopyWith<_$CreateTaskBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
