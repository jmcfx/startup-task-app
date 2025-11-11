import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_task_app/core/app/routes/app_router.gr.dart';
import 'package:startup_task_app/core/utils/delight_toast.dart';
import 'package:startup_task_app/features/items/presentation/blocs/user_item_bloc.dart';
import 'package:startup_task_app/features/items/presentation/widgets/app_loader_indicator.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<UserItemBloc>().add(const UserItemEvent.getItems(1, 10));

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      final bloc = context.read<UserItemBloc>();
      final state = bloc.state;

      if (!state.isLoadingMore && state.hasMoreData) {
        bloc.add(UserItemEvent.getItems(state.currentPage + 1, 10));
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'My Items Board',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UserItemBloc, UserItemState>(
        listenWhen: (previous, current) =>
            previous.viewState != current.viewState ||
            previous.items != current.items,
        buildWhen: (previous, current) =>
            previous.viewState != current.viewState ||
            previous.items != current.items ||
            previous.isLoadingMore != current.isLoadingMore,
        listener: (context, state) {
          if (state.viewState.isError && state.errorMessage != null) {
            DelightToast.error(message: state.errorMessage!).show(context);
          }
          if (state.viewState.isError && state.errorMessage != null) {
            DelightToast.error(message: state.errorMessage!).show(context);
          }

          if (state.viewState.isSuccess &&
              state.items.isNotEmpty &&
              state.action.isFetch &&
              state.currentPage == 1) {
            DelightToast.success(
              message: "Loaded ${state.items.length} items successfully!",
            ).show(context);
          }
          if (state.viewState.isSuccess &&
              state.items.isNotEmpty &&
              state.action.isDelete) {
            DelightToast.info(
              message: "Item deleted successfully!",
            ).show(context);
          }
          if (state.viewState.isSuccess && state.items.isEmpty) {
            DelightToast.info(message: "Please add a new item").show(context);
          }
        },
        builder: (context, state) {
          if (state.viewState.isLoading && state.items.isEmpty) {
            return AppLoaderIndicator();
          }

          if (state.viewState.isSuccess &&
              state.items.isEmpty &&
              state.action.isFetch) {
            return Center(
              child: Text(
                'No items yet.\nTap + to add one!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 20.sp),
              ),
            );
          }

          // List UI with pagination
          return SafeArea(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => context.read<UserItemBloc>().add(
                const UserItemEvent.getItems(1, 10),
              ),
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(16).r,

                itemCount: state.items.length + (state.isLoadingMore ? 1 : 0),
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  if (index >= state.items.length) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const CircularProgressIndicator.adaptive(),
                            SizedBox(height: 8.h),
                            Text(
                              'Loading more items...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final item = state.items[index];
                  return Dismissible(
                    key: Key(item.id ?? index.toString()),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      return await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm Delete'),
                                content: Text(
                                  'Are you sure you want to delete "${item.title}"?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                    },
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16).r,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      context.read<UserItemBloc>().add(
                        UserItemEvent.deleteItem(item.id!),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        context.router.push(
                          EditItemRoute(
                            id: item.id!,
                            title: item.title,
                            description: item.description,
                            name: item.name,
                            avatar: item.avatar,
                            createdAt: item.createdAt,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16).r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16).r,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 8.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: item.avatar,
                                placeholder: (context, url) => SizedBox(
                                  width: 50.w,
                                  height: 50.h,
                                  child:
                                      const CircularProgressIndicator.adaptive(),
                                ),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.grey[300],
                                      child: Icon(
                                        Icons.person,
                                        size: 30.sp,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                width: 50.w,
                                height: 50.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    item.description,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16.sp,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          context.router.push(const AddItemRoute());
        },
        label: const Text('Add Item'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
