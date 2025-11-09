import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';
import 'package:startup_task_app/features/items/presentation/pages/home_screen.dart';

class StartUpTaskApp extends StatelessWidget {
  const StartUpTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserItemBloc(
            getItemsUseCase: context.read(),
            getAddItemUseCase: context.read(),
            getDeleteItemUseCase: context.read(),
            getUpdateItemUseCase: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Startup Task App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
