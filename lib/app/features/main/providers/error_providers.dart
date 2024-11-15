import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_providers.freezed.dart';
part 'error_providers.g.dart';

@freezed
class AppError with _$AppError {
  const factory AppError({
    required String message,
    required DateTime timestamp,
    required StackTrace stackTrace,
  }) = _AppError;
}

@riverpod
class ErrorLogNotifier extends _$ErrorLogNotifier {
  @override
  List<AppError> build() => [];

  void add(String func,String message, StackTrace stackTrace) {
    debugPrint('Function: $func');
    debugPrint('Error: $message');
    debugPrint('StackTrace: $stackTrace');

    state = [
      ...state,
      AppError(
        message: message,
        timestamp: DateTime.now(),
        stackTrace: stackTrace,
      ),
    ];
  }

  void clear() => state = [];
}
