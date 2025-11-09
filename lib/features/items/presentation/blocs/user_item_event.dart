part of 'user_item_bloc.dart';

@freezed
sealed class UserItemEvent with _$UserItemEvent {
  const factory UserItemEvent.getItems() = _GetItemsEvent;
  const factory UserItemEvent.addItem(UserItemEntity item) = _AddItemEvent;
  const factory UserItemEvent.deleteItem(String id) = _DeleteItemEvent;
  const factory UserItemEvent.updateItem(UserItemEntity item) = _UpdateItemEvent;
  const factory UserItemEvent.selectItem(UserItemEntity item) = _SelectItemEvent;
}
