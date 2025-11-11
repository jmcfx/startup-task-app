import 'package:startup_task_app/core/extension/item_param_x.dart';
import 'package:startup_task_app/core/use_case/use_case.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';

class GetAddItemUseCase implements UseCase<void, ItemParams> {
  final UserItemRepository _userItemRepo;
  GetAddItemUseCase({required UserItemRepository userItemRepo})
    : _userItemRepo = userItemRepo;

  @override
  Future<FailureOr<UserItemEntity>> call(ItemParams params) {
    return _userItemRepo.addItem(params.toEntity());
  }
}
