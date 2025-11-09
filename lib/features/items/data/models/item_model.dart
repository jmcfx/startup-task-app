// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    required String? id,
    required String title,
    required String description,
    required String name,
    required String avatar,
    required String? createdAt,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

/// maps model to Entity ......

extension ItemModelX on ItemModel {
  UserItemEntity toEntity() => UserItemEntity(
    id: id,
    title: title,
    description: description,
    name: name,
    avatar: avatar,
    createdAt: createdAt,
  );
}
