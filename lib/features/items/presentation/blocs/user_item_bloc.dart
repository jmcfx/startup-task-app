import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:startup_task_app/features/items/domain/entities/user_item_entity.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_add_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_delete_item_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_items_use_case.dart';
import 'package:startup_task_app/features/items/domain/use_cases/get_update_item_use_case.dart';

import 'package:startup_task_app/features/shared/enums/view_state.dart';

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
    emit(state.copyWith(viewState: ViewState.loading));

    final result = await getAddItemUseCase((
      id: null,
      name: event.item.name,
      description: event.item.description,
      avatar: event.item.avatar,
      createdAt: null,
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
        final updatedItems = [...state.items, newItem];
        emit(state.copyWith(viewState: ViewState.success, items: updatedItems));
      },
    );
  }

  /// Get all items .....
  void _onGetItems(_GetItemsEvent event, Emitter<UserItemState> emit) async {
    emit(state.copyWith(viewState: ViewState.loading));
    final result = await getItemsUseCase(());
    result.fold(
      (failure) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (items) =>
          emit(state.copyWith(viewState: ViewState.success, items: items)),
    );
  }

  /// Delete item .....
  void _onDeleteItem(
    _DeleteItemEvent event,
    Emitter<UserItemState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.loading));

    final result = await getDeleteItemUseCase((id: event.id));

    result.fold(
      (failure) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (_) {
        final updatedItems = state.items
            .where((item) => item.id != event.id)
            .toList();
        emit(state.copyWith(viewState: ViewState.success, items: updatedItems));
      },
    );
  }

  void _onUpdateItem(
    _UpdateItemEvent event,
    Emitter<UserItemState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.loading));
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

        emit(state.copyWith(viewState: ViewState.success, items: updatedItems));
      },
    );
  }
}
