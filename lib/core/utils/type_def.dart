import 'package:dartz/dartz.dart';
import 'package:startup_task_app/core/errors/failure.dart';

typedef FailureOr<T> = Either<Failure, T>;
