abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

class UnknownError extends Failure {
  const UnknownError(super.message);
}

class BadResponseFailure extends Failure {
  final int? statusCode;
  const BadResponseFailure(super.message, {this.statusCode});

  @override
  String toString() => 'BadResponseFailure ($statusCode): $message';
}
