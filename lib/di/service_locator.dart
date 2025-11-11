import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:startup_task_app/core/networks/dio_client.dart';
import 'package:startup_task_app/core/networks/network_info.dart';
import 'package:startup_task_app/features/items/data/client/user_item_client.dart';
import 'package:startup_task_app/features/items/data/data_sources/local/item_local_data_source.dart';
import 'package:startup_task_app/features/items/data/data_sources/remote/item_remote_data_source.dart';
import 'package:startup_task_app/features/items/data/repositories_impl/user_item_repository_impl.dart';
import 'package:startup_task_app/features/items/domain/repositories/user_item_repository.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_add_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_delete_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_items_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_update_item_use_case.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeServiceLocator() async {
  //! External
  final dio = DioClient.createDio();
  final box = await Hive.openBox('tasksBox');

  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<Box>(() => box);
  sl.registerLazySingleton<UserItemClient>(() => UserItemClient(sl<Dio>()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<ItemRemoteDataSource>(
    () => ItemRemoteDataSourceImpl(client: sl<UserItemClient>()),
  );
  sl.registerLazySingleton<ItemLocalDataSource>(
    () => ItemLocalDataSourceImpl(box: sl<Box>()),
  );

  //! Repository
  sl.registerLazySingleton<UserItemRepository>(
    () => UserItemRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //! Use cases
  sl.registerLazySingleton(() => GetAddItemUseCase(userItemRepo: sl()));
  sl.registerLazySingleton(() => GetDeleteItemUseCase(userItemRepo: sl()));
  sl.registerLazySingleton(() => GetItemsUseCase(userItemRepo: sl()));
  sl.registerLazySingleton(() => GetUpdateItemUseCase(userItemRepo: sl()));

  //! Bloc
  sl.registerFactory(
    () => UserItemBloc(
      getAddItemUseCase: sl(),
      getItemsUseCase: sl(),
      getDeleteItemUseCase: sl(),
      getUpdateItemUseCase: sl(),
    ),
  );
}
