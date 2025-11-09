import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';

abstract interface class UserItemRepository {
  Future<FailureOr<List<UserItemEntity>>> getItems();
  Future<FailureOr<UserItemEntity>> addItem(UserItemEntity item);
  Future<FailureOr<UserItemEntity>> updateItem(UserItemEntity item);
  Future<FailureOr<void>> deleteItem(String id);
}
