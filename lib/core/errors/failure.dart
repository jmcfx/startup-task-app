import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  final String? details;

  const Failure({required this.message, this.details});

  @override
  List<Object?> get props => [message, details];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = "Server error", super.details});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = "Cache error", super.details});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = "No internet", super.details});
}
