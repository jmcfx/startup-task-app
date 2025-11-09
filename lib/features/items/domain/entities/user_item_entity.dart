import 'package:equatable/equatable.dart';
import 'package:startup_task_app/features/items/data/models/item_model.dart';

class UserItemEntity extends Equatable {
  final String ? id;
  final String name;
  final String description;
  final String avatar;
  final String? createdAt;
  final String title;

  const UserItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.createdAt,
    required this.title,
  });

  @override
  List<Object?> get props => [id, name, description, avatar, createdAt, title];
}

extension UserItemEntityX on UserItemEntity {
  ItemModel toModel() => ItemModel(
    id: id,
    name: name,
    description: description,
    avatar: avatar,
    createdAt: createdAt,
    title: title,
  );
}
