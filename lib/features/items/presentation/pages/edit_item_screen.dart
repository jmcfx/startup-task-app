import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';
import 'package:startup_task_app/features/items/presentation/pages/add_item_screen.dart';
import 'package:startup_task_app/features/shared/show_app_loading_dialog.dart';

@RoutePage()
class EditItemScreen extends HookWidget {
  final String id;
  final String title;
  final String description;
  final String name;
  final String? avatar;
  final String? createdAt;

  const EditItemScreen({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.name,
    this.avatar,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController(text: title);
    final descriptionController = useTextEditingController(text: description);
    final nameController = useTextEditingController(text: name);
    final avatarController = useTextEditingController(text: avatar ?? '');

    void showDeleteConfirmation() {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text("Delete Item"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
                context.read<UserItemBloc>().add(UserItemEvent.deleteItem(id));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
              child: const Text("Delete"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        title: const Text("Edit Item"),
        backgroundColor: const Color(0xffF4F6FA),
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: showDeleteConfirmation,
          ),
        ],
      ),
      body: BlocListener<UserItemBloc, UserItemState>(
        listener: (context, state) {
          if (state.viewState.isSuccess && state.action.isUpdate) {
            context.router.pop();
          }
          if (state.viewState.isLoading && state.action.isUpdate) {
            showAppLoadingDialog(context);
          } else {
            hideAppLoadingDialog(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16).r,
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
                SizedBox(height: 20.h),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a description" : null,
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: avatarController,
                  decoration: const InputDecoration(
                    labelText: "Avatar (optional image URL)",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton.icon(
                  icon: Icon(Icons.save, color: Colors.white, size: 20.sp),
                  label: Text(
                    "Save Changes",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size.fromHeight(50.r),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<UserItemBloc>().add(
                        UserItemEvent.updateItem(
                          UserItemEntity(
                            id: id.trim(),
                            name: nameController.text.trim(),
                            description: descriptionController.text.trim(),
                            avatar: avatarController.text.trim(),
                            createdAt: createdAt!.trim(),
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
