
part of 'user_item_bloc.dart';

@freezed
sealed class UserItemState with _$UserItemState {
  factory UserItemState({
    @Default(ViewState.idle) ViewState viewState,
    @Default(ItemAction.none) ItemAction action,
    @Default([]) List<UserItemEntity> items,
    String? errorMessage,
    UserItemEntity? selectedItem,
    @Default(1) int currentPage,
    @Default(true) bool hasMoreData, 
    @Default(false) bool isLoadingMore,
  }) = _UserItemState;
}
