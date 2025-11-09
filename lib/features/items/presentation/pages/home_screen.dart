import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: BlocBuilder<UserItemBloc, UserItemState>(
        builder: (context, state) {
          if (state.viewState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.items.isEmpty && !state.viewState.isSuccess) {
            return const Center(child: Text('No items yet'));
          }

          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Dismissible(
                key: Key(item.id ?? index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  context.read<UserItemBloc>().add(
                    UserItemEvent.deleteItem(item.id!),
                  );
                },
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                  onTap: () {
                    // Navigate to edit screen
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add item screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
