import 'package:startup_task_app/core/use_case/use_case.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';

class GetItemsUseCase implements UseCase<List<UserItemEntity>, NoParams> {
  final UserItemRepository _repository;
  GetItemsUseCase({required UserItemRepository repository})
    : _repository = repository;

  @override
  Future<FailureOr<List<UserItemEntity>>> call(NoParams params) {
    return _repository.getItems();
  }
}
