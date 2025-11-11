import 'package:startup_task_app/core/use_case/use_case.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';

class GetDeleteItemUseCase implements UseCase<void, GetDeleteItemParams> {
  final UserItemRepository _userItemRepo;
  GetDeleteItemUseCase({required UserItemRepository userItemRepo})
    : _userItemRepo = userItemRepo;

  @override
  Future<FailureOr<void>> call(GetDeleteItemParams params) {
    return _userItemRepo.deleteItem(params.id);
  }
}

///
typedef GetDeleteItemParams = ({String id});
