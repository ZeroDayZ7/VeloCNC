import 'package:flutter/foundation.dart';

/// A generic container for operation results.
///
/// Used to enforce explicit error handling in the UI layer and
/// avoid unexpected runtime exceptions.
@immutable
sealed class Result<T> {
  const Result();
}

/// Represents a successful operation containing [data].
class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

/// Represents a failed operation with an [error] and optional [stackTrace].
class Failure<T> extends Result<T> {
  final Object error;
  final StackTrace? stackTrace;
  const Failure(this.error, [this.stackTrace]);
}
