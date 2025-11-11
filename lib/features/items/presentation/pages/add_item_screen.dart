import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_task_app/core/utils/delight_toast.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';
import 'package:startup_task_app/features/shared/show_app_loading_dialog.dart';

void hideAppLoadingDialog(BuildContext context) {
  if (Navigator.of(context, rootNavigator: true).canPop()) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

@RoutePage()
class AddItemScreen extends HookWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final avatarController = useTextEditingController();
    final nameController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: BlocListener<UserItemBloc, UserItemState>(
        listener: (context, state) {
          if (state.viewState.isLoading && state.action.isAdd) {
            showAppLoadingDialog(context);
          } else {
            hideAppLoadingDialog(context);
          }

          if (state.viewState.isSuccess &&
              state.action.isAdd &&
              state.items.isNotEmpty) {
            context.router.pop();
            DelightToast.success(
              message: 'Item added successfully',
            ).show(context);
          }

          if (state.viewState.isError && state.errorMessage != null) {
            DelightToast.error(message: state.errorMessage!).show(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16).r,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a title" : null,
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a description" : null,
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  controller: avatarController,
                  decoration: const InputDecoration(
                    labelText: "Avatar (optional image URL)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add Item"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size.fromHeight(50.r),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<UserItemBloc>().add(
                        UserItemEvent.addItem(
                          UserItemEntity(
                            id: null,
                            name: nameController.text.trim(),
                            description: descriptionController.text.trim(),
                            avatar: avatarController.text.trim(),
                            createdAt: null,
                            title: titleController.text.trim(),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
