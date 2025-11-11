import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_task_app/core/app/routes/app_router.dart';
import 'package:startup_task_app/di/service_locator.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_add_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_delete_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_items_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_update_item_use_case.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';
import 'package:startup_task_app/features/shared/unfocus.dart';

class StartUpTaskApp extends StatelessWidget {
  StartUpTaskApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserItemBloc(
            getItemsUseCase: sl<GetItemsUseCase>(),
            getAddItemUseCase: sl<GetAddItemUseCase>(),
            getDeleteItemUseCase: sl<GetDeleteItemUseCase>(),
            getUpdateItemUseCase: sl<GetUpdateItemUseCase>(),
          ),
        ),
      ],
      child: Unfocus(
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: ScreenUtilInit(
            designSize: const Size(440, 956),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Startup Task App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              routerConfig: appRouter.config(),
            ),
          ),
        ),
      ),
    );
  }
}
