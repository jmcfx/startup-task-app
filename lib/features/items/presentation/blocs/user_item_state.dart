
part of 'user_item_bloc.dart';

@freezed
sealed class UserItemState with _$UserItemState {
  factory UserItemState([
    @Default(ViewState.idle) ViewState viewState,
    @Default([]) List<UserItemEntity> items,
     String? errorMessage,
      UserItemEntity? selectedItem,
  ]) = _UserItemState;
}
