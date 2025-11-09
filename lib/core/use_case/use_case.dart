import 'package:startup_task_app/core/utils/type_def.dart';

/// This takes [Params] as input and returns Either Failure or [DataType]
abstract interface class UseCase<DataType, Params> {
  Future<FailureOr<DataType>> call(Params params);
}

/// use_case that don't take params || classes can work but i will go with records this time
/// used records because then are immutable and have prebuilt value equality..
typedef NoParams = ();

/// Parameters required .
typedef ItemParams = ({
  String? id,
  String name,
  String description,
  String avatar,
  String? createdAt,
  String title,
});
