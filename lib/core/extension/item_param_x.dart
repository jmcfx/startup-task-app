import 'package:startup_task_app/core/use_case/use_case.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';

/// maps params to user entity .....
extension ItemParamsX on ItemParams {
  UserItemEntity toEntity() => UserItemEntity(
    id: id ,
    name: name,
    description: description,
    avatar: avatar,
    createdAt: createdAt,
    title: title,
  );
}
