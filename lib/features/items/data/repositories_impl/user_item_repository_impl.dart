import 'package:dio/dio.dart';
import 'package:startup_task_app/core/errors/exceptions.dart';
import 'package:startup_task_app/core/errors/failure.dart';
import 'package:startup_task_app/core/networks/network_info.dart';
import 'package:startup_task_app/core/utils/map_exception_to_failure.dart';
import 'package:startup_task_app/core/utils/type_def.dart';
import 'package:startup_task_app/features/items/data/data_sources/local/item_local_data_source.dart';
import 'package:startup_task_app/features/items/data/data_sources/remote/item_remote_data_source.dart';
import 'package:startup_task_app/features/items/data/models/item_model.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';
import 'package:dartz/dartz.dart';

class UserItemRepositoryImpl implements UserItemRepository {
  final ItemRemoteDataSource _remoteDataSource;
  final ItemLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  UserItemRepositoryImpl({
    required ItemRemoteDataSource remoteDataSource,
    required ItemLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _networkInfo = networkInfo;

  @override
  Future<FailureOr<List<UserItemEntity>>> getItems({
    int page = 1,
    int limit = 10,
  }) async {
    final isConnected = await _networkInfo.isConnected;

    try {
      if (isConnected) {
        final fetchedData = await _remoteDataSource.getItems(
          page: page,
          limit: limit,
        );

        if (page == 1) {
          await _localDataSource.cacheItems(fetchedData);
        }

        return Right(fetchedData.map((e) => e.toEntity()).toList());
      } else {
        // OFFLINE MODE
        try {
          final cachedData = await _localDataSource.getItems();

          final startIndex = (page - 1) * limit;
          final endIndex = startIndex + limit;

          if (startIndex >= cachedData.length) {
            return const Right([]);
          }

          // Get paginated slice of cached data
          final paginatedData = cachedData.sublist(
            startIndex,
            endIndex > cachedData.length ? cachedData.length : endIndex,
          );

          return Right(paginatedData.map((e) => e.toEntity()).toList());
        } on CacheException {
          return Left(
            NoInternetFailure(
              message: 'No internet connection and no cached data available',
            ),
          );
        }
      }
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } on CacheException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<FailureOr<UserItemEntity>> addItem(UserItemEntity item) async {
    final isConnected = await _networkInfo.isConnected;
    try {
      if (isConnected) {
        final fetchData = await _remoteDataSource.addItem(item.toModel());

        final cachedItems = await _localDataSource.getItems();
        await _localDataSource.cacheItems([fetchData, ...cachedItems]);

        return Right(fetchData.toEntity());
      } else {
        return Left(
          NoInternetFailure(message: 'Cannot add item while offline'),
        );
      }
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } on CacheException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<FailureOr<UserItemEntity>> updateItem(UserItemEntity item) async {
    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(message: 'Cannot update item while offline'),
      );
    }

    try {
      final updatedItem = await _remoteDataSource.updateItem(item.toModel());

      final cachedItems = await _localDataSource.getItems();
      final updatedList = cachedItems.map((cached) {
        return cached.id == item.id ? updatedItem : cached;
      }).toList();
      await _localDataSource.cacheItems(updatedList);

      return Right(updatedItem.toEntity());
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<FailureOr<void>> deleteItem(String id) async {
    final isConnected = await _networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(message: 'Cannot delete item while offline'),
      );
    }

    try {
      await _remoteDataSource.deleteItem(id);

      final cachedItems = await _localDataSource.getItems();
      final updatedItems = cachedItems.where((item) => item.id != id).toList();
      await _localDataSource.cacheItems(updatedItems);

      return Right(null);
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
