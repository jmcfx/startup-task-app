import 'package:startup_task_app/core/errors/failure.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/data/data_sources/item_remote_data_source.dart';
import 'package:startup_task_app/features/items/data/models/item_model.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';
import 'package:dartz/dartz.dart';

class UserItemRepositoryImpl implements UserItemRepository {
  final ItemRemoteDataSource _remoteDataSource;

  UserItemRepositoryImpl({required ItemRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<FailureOr<List<UserItemEntity>>> getItems() async {
    try {
      final items = await _remoteDataSource.getItems();
      final entities = items.map((e) => e.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<FailureOr<UserItemEntity>> addItem(UserItemEntity item) async {
    try {
      final model = await _remoteDataSource.addItem(item.toModel());
      return right(model.toEntity());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<FailureOr<UserItemEntity>> updateItem(UserItemEntity item) async {
    try {
      await _remoteDataSource.updateItem(item.toModel());
      return right(item);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<FailureOr<void>> deleteItem(String id) async {
    try {
      await _remoteDataSource.deleteItem(id);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
