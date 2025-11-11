import 'package:startup_task_app/core/use_case/use_case.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';

class GetItemsUseCase implements UseCase<List<UserItemEntity>, GetItemsParams> {
  final UserItemRepository _userItemRepo;
  GetItemsUseCase({required UserItemRepository userItemRepo})
    : _userItemRepo = userItemRepo;

  @override
  Future<FailureOr<List<UserItemEntity>>> call(GetItemsParams params) {
    return _userItemRepo.getItems(page: params.page, limit: params.limit);
  }
}

typedef GetItemsParams = ({int page, int limit});
