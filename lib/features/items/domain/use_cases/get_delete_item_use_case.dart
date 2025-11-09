import 'package:startup_task_app/core/use_case/use_case.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';

class GetDeleteItemUseCase implements UseCase<void, GetDeleteItemParams> {
  final UserItemRepository _repository;
  GetDeleteItemUseCase({required UserItemRepository repository})
    : _repository = repository;

  @override
  Future<FailureOr<void>> call(GetDeleteItemParams params) {
    return _repository.deleteItem(params.id);
  }
}
/// 
typedef GetDeleteItemParams = ({String id});
