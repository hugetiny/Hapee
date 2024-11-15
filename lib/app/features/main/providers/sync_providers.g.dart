// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksHash() => r'81f3f0336e9d06798f79dc659ac99499b3782335';

/// 任务列表状态
///
/// Copied from [tasks].
@ProviderFor(tasks)
final tasksProvider = AutoDisposeStreamProvider<List<Task>>.internal(
  tasks,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksRef = AutoDisposeStreamProviderRef<List<Task>>;
String _$createTaskHash() => r'85899cf0cb19d46f2191dcf83f84081861350020';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 创建任务
///
/// Copied from [createTask].
@ProviderFor(createTask)
const createTaskProvider = CreateTaskFamily();

/// 创建任务
///
/// Copied from [createTask].
class CreateTaskFamily extends Family<AsyncValue<void>> {
  /// 创建任务
  ///
  /// Copied from [createTask].
  const CreateTaskFamily();

  /// 创建任务
  ///
  /// Copied from [createTask].
  CreateTaskProvider call(
    CreateTask task,
  ) {
    return CreateTaskProvider(
      task,
    );
  }

  @override
  CreateTaskProvider getProviderOverride(
    covariant CreateTaskProvider provider,
  ) {
    return call(
      provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createTaskProvider';
}

/// 创建任务
///
/// Copied from [createTask].
class CreateTaskProvider extends AutoDisposeFutureProvider<void> {
  /// 创建任务
  ///
  /// Copied from [createTask].
  CreateTaskProvider(
    CreateTask task,
  ) : this._internal(
          (ref) => createTask(
            ref as CreateTaskRef,
            task,
          ),
          from: createTaskProvider,
          name: r'createTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTaskHash,
          dependencies: CreateTaskFamily._dependencies,
          allTransitiveDependencies:
              CreateTaskFamily._allTransitiveDependencies,
          task: task,
        );

  CreateTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final CreateTask task;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTaskProvider._internal(
        (ref) => create(ref as CreateTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        task: task,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTaskProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateTaskRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `task` of this provider.
  CreateTask get task;
}

class _CreateTaskProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateTaskRef {
  _CreateTaskProviderElement(super.provider);

  @override
  CreateTask get task => (origin as CreateTaskProvider).task;
}

String _$createTaskBatchHash() => r'b7d19e2391c4fba44eefa4cc03a898e2177321ed';

/// 批量创建任务
///
/// Copied from [createTaskBatch].
@ProviderFor(createTaskBatch)
const createTaskBatchProvider = CreateTaskBatchFamily();

/// 批量创建任务
///
/// Copied from [createTaskBatch].
class CreateTaskBatchFamily extends Family<AsyncValue<void>> {
  /// 批量创建任务
  ///
  /// Copied from [createTaskBatch].
  const CreateTaskBatchFamily();

  /// 批量创建任务
  ///
  /// Copied from [createTaskBatch].
  CreateTaskBatchProvider call(
    CreateTaskBatch batch,
  ) {
    return CreateTaskBatchProvider(
      batch,
    );
  }

  @override
  CreateTaskBatchProvider getProviderOverride(
    covariant CreateTaskBatchProvider provider,
  ) {
    return call(
      provider.batch,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createTaskBatchProvider';
}

/// 批量创建任务
///
/// Copied from [createTaskBatch].
class CreateTaskBatchProvider extends AutoDisposeFutureProvider<void> {
  /// 批量创建任务
  ///
  /// Copied from [createTaskBatch].
  CreateTaskBatchProvider(
    CreateTaskBatch batch,
  ) : this._internal(
          (ref) => createTaskBatch(
            ref as CreateTaskBatchRef,
            batch,
          ),
          from: createTaskBatchProvider,
          name: r'createTaskBatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTaskBatchHash,
          dependencies: CreateTaskBatchFamily._dependencies,
          allTransitiveDependencies:
              CreateTaskBatchFamily._allTransitiveDependencies,
          batch: batch,
        );

  CreateTaskBatchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.batch,
  }) : super.internal();

  final CreateTaskBatch batch;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateTaskBatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTaskBatchProvider._internal(
        (ref) => create(ref as CreateTaskBatchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        batch: batch,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateTaskBatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTaskBatchProvider && other.batch == batch;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, batch.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateTaskBatchRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `batch` of this provider.
  CreateTaskBatch get batch;
}

class _CreateTaskBatchProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateTaskBatchRef {
  _CreateTaskBatchProviderElement(super.provider);

  @override
  CreateTaskBatch get batch => (origin as CreateTaskBatchProvider).batch;
}

String _$pauseTaskHash() => r'4a0b5f24b16f5b81978a272d30565e97b29ec333';

/// 暂停任务
///
/// Copied from [pauseTask].
@ProviderFor(pauseTask)
const pauseTaskProvider = PauseTaskFamily();

/// 暂停任务
///
/// Copied from [pauseTask].
class PauseTaskFamily extends Family<AsyncValue<void>> {
  /// 暂停任务
  ///
  /// Copied from [pauseTask].
  const PauseTaskFamily();

  /// 暂停任务
  ///
  /// Copied from [pauseTask].
  PauseTaskProvider call(
    String id,
  ) {
    return PauseTaskProvider(
      id,
    );
  }

  @override
  PauseTaskProvider getProviderOverride(
    covariant PauseTaskProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pauseTaskProvider';
}

/// 暂停任务
///
/// Copied from [pauseTask].
class PauseTaskProvider extends AutoDisposeFutureProvider<void> {
  /// 暂停任务
  ///
  /// Copied from [pauseTask].
  PauseTaskProvider(
    String id,
  ) : this._internal(
          (ref) => pauseTask(
            ref as PauseTaskRef,
            id,
          ),
          from: pauseTaskProvider,
          name: r'pauseTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pauseTaskHash,
          dependencies: PauseTaskFamily._dependencies,
          allTransitiveDependencies: PauseTaskFamily._allTransitiveDependencies,
          id: id,
        );

  PauseTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<void> Function(PauseTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PauseTaskProvider._internal(
        (ref) => create(ref as PauseTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PauseTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PauseTaskProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PauseTaskRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PauseTaskProviderElement extends AutoDisposeFutureProviderElement<void>
    with PauseTaskRef {
  _PauseTaskProviderElement(super.provider);

  @override
  String get id => (origin as PauseTaskProvider).id;
}

String _$pauseTasksHash() => r'3e5c63773df3949fc8b369de75acab7001463ea8';

/// 批量暂停任务
///
/// Copied from [pauseTasks].
@ProviderFor(pauseTasks)
const pauseTasksProvider = PauseTasksFamily();

/// 批量暂停任务
///
/// Copied from [pauseTasks].
class PauseTasksFamily extends Family<AsyncValue<void>> {
  /// 批量暂停任务
  ///
  /// Copied from [pauseTasks].
  const PauseTasksFamily();

  /// 批量暂停任务
  ///
  /// Copied from [pauseTasks].
  PauseTasksProvider call({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) {
    return PauseTasksProvider(
      ids: ids,
      statuses: statuses,
      notStatuses: notStatuses,
    );
  }

  @override
  PauseTasksProvider getProviderOverride(
    covariant PauseTasksProvider provider,
  ) {
    return call(
      ids: provider.ids,
      statuses: provider.statuses,
      notStatuses: provider.notStatuses,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pauseTasksProvider';
}

/// 批量暂停任务
///
/// Copied from [pauseTasks].
class PauseTasksProvider extends AutoDisposeFutureProvider<void> {
  /// 批量暂停任务
  ///
  /// Copied from [pauseTasks].
  PauseTasksProvider({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) : this._internal(
          (ref) => pauseTasks(
            ref as PauseTasksRef,
            ids: ids,
            statuses: statuses,
            notStatuses: notStatuses,
          ),
          from: pauseTasksProvider,
          name: r'pauseTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pauseTasksHash,
          dependencies: PauseTasksFamily._dependencies,
          allTransitiveDependencies:
              PauseTasksFamily._allTransitiveDependencies,
          ids: ids,
          statuses: statuses,
          notStatuses: notStatuses,
        );

  PauseTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
    required this.statuses,
    required this.notStatuses,
  }) : super.internal();

  final List<String>? ids;
  final List<Status>? statuses;
  final List<Status>? notStatuses;

  @override
  Override overrideWith(
    FutureOr<void> Function(PauseTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PauseTasksProvider._internal(
        (ref) => create(ref as PauseTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
        statuses: statuses,
        notStatuses: notStatuses,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PauseTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PauseTasksProvider &&
        other.ids == ids &&
        other.statuses == statuses &&
        other.notStatuses == notStatuses;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);
    hash = _SystemHash.combine(hash, statuses.hashCode);
    hash = _SystemHash.combine(hash, notStatuses.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PauseTasksRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `ids` of this provider.
  List<String>? get ids;

  /// The parameter `statuses` of this provider.
  List<Status>? get statuses;

  /// The parameter `notStatuses` of this provider.
  List<Status>? get notStatuses;
}

class _PauseTasksProviderElement extends AutoDisposeFutureProviderElement<void>
    with PauseTasksRef {
  _PauseTasksProviderElement(super.provider);

  @override
  List<String>? get ids => (origin as PauseTasksProvider).ids;
  @override
  List<Status>? get statuses => (origin as PauseTasksProvider).statuses;
  @override
  List<Status>? get notStatuses => (origin as PauseTasksProvider).notStatuses;
}

String _$continueTaskHash() => r'c9b89e446ae34d1c42a70fc56fadceefe2bf2342';

/// 继续任务
///
/// Copied from [continueTask].
@ProviderFor(continueTask)
const continueTaskProvider = ContinueTaskFamily();

/// 继续任务
///
/// Copied from [continueTask].
class ContinueTaskFamily extends Family<AsyncValue<void>> {
  /// 继续任务
  ///
  /// Copied from [continueTask].
  const ContinueTaskFamily();

  /// 继续任务
  ///
  /// Copied from [continueTask].
  ContinueTaskProvider call(
    String id,
  ) {
    return ContinueTaskProvider(
      id,
    );
  }

  @override
  ContinueTaskProvider getProviderOverride(
    covariant ContinueTaskProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'continueTaskProvider';
}

/// 继续任务
///
/// Copied from [continueTask].
class ContinueTaskProvider extends AutoDisposeFutureProvider<void> {
  /// 继续任务
  ///
  /// Copied from [continueTask].
  ContinueTaskProvider(
    String id,
  ) : this._internal(
          (ref) => continueTask(
            ref as ContinueTaskRef,
            id,
          ),
          from: continueTaskProvider,
          name: r'continueTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$continueTaskHash,
          dependencies: ContinueTaskFamily._dependencies,
          allTransitiveDependencies:
              ContinueTaskFamily._allTransitiveDependencies,
          id: id,
        );

  ContinueTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<void> Function(ContinueTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ContinueTaskProvider._internal(
        (ref) => create(ref as ContinueTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ContinueTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContinueTaskProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContinueTaskRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ContinueTaskProviderElement
    extends AutoDisposeFutureProviderElement<void> with ContinueTaskRef {
  _ContinueTaskProviderElement(super.provider);

  @override
  String get id => (origin as ContinueTaskProvider).id;
}

String _$continueTasksHash() => r'67d516d229ba84aec0d6a3465ae10eedf1432694';

/// 批量继续任务
///
/// Copied from [continueTasks].
@ProviderFor(continueTasks)
const continueTasksProvider = ContinueTasksFamily();

/// 批量继续任务
///
/// Copied from [continueTasks].
class ContinueTasksFamily extends Family<AsyncValue<void>> {
  /// 批量继续任务
  ///
  /// Copied from [continueTasks].
  const ContinueTasksFamily();

  /// 批量继续任务
  ///
  /// Copied from [continueTasks].
  ContinueTasksProvider call({
    List<Status>? statuses,
  }) {
    return ContinueTasksProvider(
      statuses: statuses,
    );
  }

  @override
  ContinueTasksProvider getProviderOverride(
    covariant ContinueTasksProvider provider,
  ) {
    return call(
      statuses: provider.statuses,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'continueTasksProvider';
}

/// 批量继续任务
///
/// Copied from [continueTasks].
class ContinueTasksProvider extends AutoDisposeFutureProvider<void> {
  /// 批量继续任务
  ///
  /// Copied from [continueTasks].
  ContinueTasksProvider({
    List<Status>? statuses,
  }) : this._internal(
          (ref) => continueTasks(
            ref as ContinueTasksRef,
            statuses: statuses,
          ),
          from: continueTasksProvider,
          name: r'continueTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$continueTasksHash,
          dependencies: ContinueTasksFamily._dependencies,
          allTransitiveDependencies:
              ContinueTasksFamily._allTransitiveDependencies,
          statuses: statuses,
        );

  ContinueTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.statuses,
  }) : super.internal();

  final List<Status>? statuses;

  @override
  Override overrideWith(
    FutureOr<void> Function(ContinueTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ContinueTasksProvider._internal(
        (ref) => create(ref as ContinueTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        statuses: statuses,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ContinueTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContinueTasksProvider && other.statuses == statuses;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, statuses.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContinueTasksRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `statuses` of this provider.
  List<Status>? get statuses;
}

class _ContinueTasksProviderElement
    extends AutoDisposeFutureProviderElement<void> with ContinueTasksRef {
  _ContinueTasksProviderElement(super.provider);

  @override
  List<Status>? get statuses => (origin as ContinueTasksProvider).statuses;
}

String _$deleteTaskHash() => r'9b9785b8f3e5507157c0ef6295d87135f885202d';

/// 删除任务
///
/// Copied from [deleteTask].
@ProviderFor(deleteTask)
const deleteTaskProvider = DeleteTaskFamily();

/// 删除任务
///
/// Copied from [deleteTask].
class DeleteTaskFamily extends Family<AsyncValue<void>> {
  /// 删除任务
  ///
  /// Copied from [deleteTask].
  const DeleteTaskFamily();

  /// 删除任务
  ///
  /// Copied from [deleteTask].
  DeleteTaskProvider call(
    String id,
    bool force,
  ) {
    return DeleteTaskProvider(
      id,
      force,
    );
  }

  @override
  DeleteTaskProvider getProviderOverride(
    covariant DeleteTaskProvider provider,
  ) {
    return call(
      provider.id,
      provider.force,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteTaskProvider';
}

/// 删除任务
///
/// Copied from [deleteTask].
class DeleteTaskProvider extends AutoDisposeFutureProvider<void> {
  /// 删除任务
  ///
  /// Copied from [deleteTask].
  DeleteTaskProvider(
    String id,
    bool force,
  ) : this._internal(
          (ref) => deleteTask(
            ref as DeleteTaskRef,
            id,
            force,
          ),
          from: deleteTaskProvider,
          name: r'deleteTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteTaskHash,
          dependencies: DeleteTaskFamily._dependencies,
          allTransitiveDependencies:
              DeleteTaskFamily._allTransitiveDependencies,
          id: id,
          force: force,
        );

  DeleteTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.force,
  }) : super.internal();

  final String id;
  final bool force;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTaskProvider._internal(
        (ref) => create(ref as DeleteTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        force: force,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTaskProvider &&
        other.id == id &&
        other.force == force;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, force.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteTaskRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `force` of this provider.
  bool get force;
}

class _DeleteTaskProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteTaskRef {
  _DeleteTaskProviderElement(super.provider);

  @override
  String get id => (origin as DeleteTaskProvider).id;
  @override
  bool get force => (origin as DeleteTaskProvider).force;
}

String _$deleteTasksHash() => r'8920e4331741f892400df4c5223bcccbb8acfef8';

/// 批量删除任务
///
/// Copied from [deleteTasks].
@ProviderFor(deleteTasks)
const deleteTasksProvider = DeleteTasksFamily();

/// 批量删除任务
///
/// Copied from [deleteTasks].
class DeleteTasksFamily extends Family<AsyncValue<void>> {
  /// 批量删除任务
  ///
  /// Copied from [deleteTasks].
  const DeleteTasksFamily();

  /// 批量删除任务
  ///
  /// Copied from [deleteTasks].
  DeleteTasksProvider call({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
    bool force = false,
  }) {
    return DeleteTasksProvider(
      ids: ids,
      statuses: statuses,
      notStatuses: notStatuses,
      force: force,
    );
  }

  @override
  DeleteTasksProvider getProviderOverride(
    covariant DeleteTasksProvider provider,
  ) {
    return call(
      ids: provider.ids,
      statuses: provider.statuses,
      notStatuses: provider.notStatuses,
      force: provider.force,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteTasksProvider';
}

/// 批量删除任务
///
/// Copied from [deleteTasks].
class DeleteTasksProvider extends AutoDisposeFutureProvider<void> {
  /// 批量删除任务
  ///
  /// Copied from [deleteTasks].
  DeleteTasksProvider({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
    bool force = false,
  }) : this._internal(
          (ref) => deleteTasks(
            ref as DeleteTasksRef,
            ids: ids,
            statuses: statuses,
            notStatuses: notStatuses,
            force: force,
          ),
          from: deleteTasksProvider,
          name: r'deleteTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteTasksHash,
          dependencies: DeleteTasksFamily._dependencies,
          allTransitiveDependencies:
              DeleteTasksFamily._allTransitiveDependencies,
          ids: ids,
          statuses: statuses,
          notStatuses: notStatuses,
          force: force,
        );

  DeleteTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
    required this.statuses,
    required this.notStatuses,
    required this.force,
  }) : super.internal();

  final List<String>? ids;
  final List<Status>? statuses;
  final List<Status>? notStatuses;
  final bool force;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTasksProvider._internal(
        (ref) => create(ref as DeleteTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
        statuses: statuses,
        notStatuses: notStatuses,
        force: force,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTasksProvider &&
        other.ids == ids &&
        other.statuses == statuses &&
        other.notStatuses == notStatuses &&
        other.force == force;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);
    hash = _SystemHash.combine(hash, statuses.hashCode);
    hash = _SystemHash.combine(hash, notStatuses.hashCode);
    hash = _SystemHash.combine(hash, force.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteTasksRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `ids` of this provider.
  List<String>? get ids;

  /// The parameter `statuses` of this provider.
  List<Status>? get statuses;

  /// The parameter `notStatuses` of this provider.
  List<Status>? get notStatuses;

  /// The parameter `force` of this provider.
  bool get force;
}

class _DeleteTasksProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteTasksRef {
  _DeleteTasksProviderElement(super.provider);

  @override
  List<String>? get ids => (origin as DeleteTasksProvider).ids;
  @override
  List<Status>? get statuses => (origin as DeleteTasksProvider).statuses;
  @override
  List<Status>? get notStatuses => (origin as DeleteTasksProvider).notStatuses;
  @override
  bool get force => (origin as DeleteTasksProvider).force;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
