import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:startup_task_app/core/enums/item_action.dart';

import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_add_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_delete_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_items_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_update_item_use_case.dart';

import 'package:startup_task_app/core/enums/view_state.dart';

part 'user_item_event.dart';
part 'user_item_state.dart';
part 'user_item_bloc.freezed.dart';

class UserItemBloc extends Bloc<UserItemEvent, UserItemState> {
  final GetItemsUseCase getItemsUseCase;
  final GetAddItemUseCase getAddItemUseCase;
  final GetDeleteItemUseCase getDeleteItemUseCase;
  final GetUpdateItemUseCase getUpdateItemUseCase;

  UserItemBloc({
    required this.getItemsUseCase,
    required this.getAddItemUseCase,
    required this.getDeleteItemUseCase,
    required this.getUpdateItemUseCase,
  }) : super(UserItemState()) {
    on<_AddItemEvent>(_onAddItem);
    on<_GetItemsEvent>(_onGetItems);
    on<_DeleteItemEvent>(_onDeleteItem);
    on<_UpdateItemEvent>(_onUpdateItem);
  }

  void _onAddItem(_AddItemEvent event, Emitter<UserItemState> emit) async {
    emit(state.copyWith(viewState: ViewState.loading, action: ItemAction.add));

    final result = await getAddItemUseCase((
      id: null,
      name: event.item.name,
      description: event.item.description,
      avatar: event.item.avatar,
      createdAt: DateTime.now().toString(),
      title: event.item.title,
    ));

    result.fold(
      (failure) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (newItem) {
        final updatedItems = [newItem, ...state.items];
        emit(
          state.copyWith(
            viewState: ViewState.success,
            items: updatedItems,
            action: ItemAction.add,
          ),
        );
      },
    );
  }

  void _onGetItems(_GetItemsEvent event, Emitter<UserItemState> emit) async {
    final isFirstPage = event.page == 1;

    if (isFirstPage) {
      emit(state.copyWith(viewState: ViewState.loading, items: []));
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    final result = await getItemsUseCase((
      page: event.page,
      limit: event.limit,
    ));

    result.fold(
      (failure) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
          isLoadingMore: false,
          hasMoreData: false,
        ),
      ),
      (newItems) {
        final updatedItems = isFirstPage
            ? newItems
            : [...state.items, ...newItems];

        final hasMore = newItems.length >= event.limit;

        emit(
          state.copyWith(
            viewState: ViewState.success,
            items: updatedItems,
            currentPage: event.page,
            hasMoreData: hasMore,
            isLoadingMore: false,
            action: ItemAction.fetch,
          ),
        );
      },
    );
  }

  ///Delete Item......
  void _onDeleteItem(
    _DeleteItemEvent event,
    Emitter<UserItemState> emit,
  ) async {
    final previousItems = state.items;

    final optimisticItems = state.items
        .where((item) => item.id != event.id)
        .toList();

    emit(state.copyWith(viewState: ViewState.loading, items: optimisticItems));

    final result = await getDeleteItemUseCase((id: event.id));

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            viewState: ViewState.error,
            errorMessage: failure.message,
            items: previousItems,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            viewState: ViewState.success,
            items: optimisticItems,
            action: ItemAction.delete,
          ),
        );
      },
    );
  }

  void _onUpdateItem(
    _UpdateItemEvent event,
    Emitter<UserItemState> emit,
  ) async {
    emit(
      state.copyWith(viewState: ViewState.loading, action: ItemAction.update),
    );
    final result = await getUpdateItemUseCase((
      id: event.item.id,
      name: event.item.name,
      description: event.item.description,
      avatar: event.item.avatar,
      createdAt: event.item.createdAt,
      title: event.item.title,
    ));

    result.fold(
      (failure) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (updatedItem) {
        final updatedItems = state.items.map((e) {
          if (e.id == updatedItem.id) {
            return updatedItem;
          }
          return e;
        }).toList();

        emit(
          state.copyWith(
            viewState: ViewState.success,
            items: updatedItems,
            action: ItemAction.update,
          ),
        );
      },
    );
  }
}
