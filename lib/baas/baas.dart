

enum DatabaseType { firebase, pocketbase }

abstract class BaaS {
  Future<void> initialize();
  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<T?> getData<T>({
    required String collection,
    required String id,
    required T Function(Map<String, dynamic> json) fromJson,
  });

  Future<List<T>> getDataList<T>({
    required String collection,
    required T Function(Map<String, dynamic> json) fromJson,
    String? filter,
    int? page,
    int? perPage,
  });

  Stream<T> streamData<T>({
    required String collection,
    required String id,
    required T Function(Map<String, dynamic> json) fromJson,
  });
}
