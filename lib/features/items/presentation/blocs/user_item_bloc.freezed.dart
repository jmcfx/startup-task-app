// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserItemEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserItemEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserItemEvent()';
}


}

/// @nodoc
class $UserItemEventCopyWith<$Res>  {
$UserItemEventCopyWith(UserItemEvent _, $Res Function(UserItemEvent) __);
}


/// Adds pattern-matching-related methods to [UserItemEvent].
extension UserItemEventPatterns on UserItemEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetItemsEvent value)?  getItems,TResult Function( _AddItemEvent value)?  addItem,TResult Function( _DeleteItemEvent value)?  deleteItem,TResult Function( _UpdateItemEvent value)?  updateItem,TResult Function( _SelectItemEvent value)?  selectItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetItemsEvent() when getItems != null:
return getItems(_that);case _AddItemEvent() when addItem != null:
return addItem(_that);case _DeleteItemEvent() when deleteItem != null:
return deleteItem(_that);case _UpdateItemEvent() when updateItem != null:
return updateItem(_that);case _SelectItemEvent() when selectItem != null:
return selectItem(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetItemsEvent value)  getItems,required TResult Function( _AddItemEvent value)  addItem,required TResult Function( _DeleteItemEvent value)  deleteItem,required TResult Function( _UpdateItemEvent value)  updateItem,required TResult Function( _SelectItemEvent value)  selectItem,}){
final _that = this;
switch (_that) {
case _GetItemsEvent():
return getItems(_that);case _AddItemEvent():
return addItem(_that);case _DeleteItemEvent():
return deleteItem(_that);case _UpdateItemEvent():
return updateItem(_that);case _SelectItemEvent():
return selectItem(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetItemsEvent value)?  getItems,TResult? Function( _AddItemEvent value)?  addItem,TResult? Function( _DeleteItemEvent value)?  deleteItem,TResult? Function( _UpdateItemEvent value)?  updateItem,TResult? Function( _SelectItemEvent value)?  selectItem,}){
final _that = this;
switch (_that) {
case _GetItemsEvent() when getItems != null:
return getItems(_that);case _AddItemEvent() when addItem != null:
return addItem(_that);case _DeleteItemEvent() when deleteItem != null:
return deleteItem(_that);case _UpdateItemEvent() when updateItem != null:
return updateItem(_that);case _SelectItemEvent() when selectItem != null:
return selectItem(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page,  int limit)?  getItems,TResult Function( UserItemEntity item)?  addItem,TResult Function( String id)?  deleteItem,TResult Function( UserItemEntity item)?  updateItem,TResult Function( UserItemEntity item)?  selectItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetItemsEvent() when getItems != null:
return getItems(_that.page,_that.limit);case _AddItemEvent() when addItem != null:
return addItem(_that.item);case _DeleteItemEvent() when deleteItem != null:
return deleteItem(_that.id);case _UpdateItemEvent() when updateItem != null:
return updateItem(_that.item);case _SelectItemEvent() when selectItem != null:
return selectItem(_that.item);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page,  int limit)  getItems,required TResult Function( UserItemEntity item)  addItem,required TResult Function( String id)  deleteItem,required TResult Function( UserItemEntity item)  updateItem,required TResult Function( UserItemEntity item)  selectItem,}) {final _that = this;
switch (_that) {
case _GetItemsEvent():
return getItems(_that.page,_that.limit);case _AddItemEvent():
return addItem(_that.item);case _DeleteItemEvent():
return deleteItem(_that.id);case _UpdateItemEvent():
return updateItem(_that.item);case _SelectItemEvent():
return selectItem(_that.item);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page,  int limit)?  getItems,TResult? Function( UserItemEntity item)?  addItem,TResult? Function( String id)?  deleteItem,TResult? Function( UserItemEntity item)?  updateItem,TResult? Function( UserItemEntity item)?  selectItem,}) {final _that = this;
switch (_that) {
case _GetItemsEvent() when getItems != null:
return getItems(_that.page,_that.limit);case _AddItemEvent() when addItem != null:
return addItem(_that.item);case _DeleteItemEvent() when deleteItem != null:
return deleteItem(_that.id);case _UpdateItemEvent() when updateItem != null:
return updateItem(_that.item);case _SelectItemEvent() when selectItem != null:
return selectItem(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _GetItemsEvent implements UserItemEvent {
  const _GetItemsEvent([this.page = 1, this.limit = 10]);
  

@JsonKey() final  int page;
@JsonKey() final  int limit;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetItemsEventCopyWith<_GetItemsEvent> get copyWith => __$GetItemsEventCopyWithImpl<_GetItemsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItemsEvent&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit);

@override
String toString() {
  return 'UserItemEvent.getItems(page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$GetItemsEventCopyWith<$Res> implements $UserItemEventCopyWith<$Res> {
  factory _$GetItemsEventCopyWith(_GetItemsEvent value, $Res Function(_GetItemsEvent) _then) = __$GetItemsEventCopyWithImpl;
@useResult
$Res call({
 int page, int limit
});




}
/// @nodoc
class __$GetItemsEventCopyWithImpl<$Res>
    implements _$GetItemsEventCopyWith<$Res> {
  __$GetItemsEventCopyWithImpl(this._self, this._then);

  final _GetItemsEvent _self;
  final $Res Function(_GetItemsEvent) _then;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,}) {
  return _then(_GetItemsEvent(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddItemEvent implements UserItemEvent {
  const _AddItemEvent(this.item);
  

 final  UserItemEntity item;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddItemEventCopyWith<_AddItemEvent> get copyWith => __$AddItemEventCopyWithImpl<_AddItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddItemEvent&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'UserItemEvent.addItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$AddItemEventCopyWith<$Res> implements $UserItemEventCopyWith<$Res> {
  factory _$AddItemEventCopyWith(_AddItemEvent value, $Res Function(_AddItemEvent) _then) = __$AddItemEventCopyWithImpl;
@useResult
$Res call({
 UserItemEntity item
});




}
/// @nodoc
class __$AddItemEventCopyWithImpl<$Res>
    implements _$AddItemEventCopyWith<$Res> {
  __$AddItemEventCopyWithImpl(this._self, this._then);

  final _AddItemEvent _self;
  final $Res Function(_AddItemEvent) _then;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_AddItemEvent(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as UserItemEntity,
  ));
}


}

/// @nodoc


class _DeleteItemEvent implements UserItemEvent {
  const _DeleteItemEvent(this.id);
  

 final  String id;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteItemEventCopyWith<_DeleteItemEvent> get copyWith => __$DeleteItemEventCopyWithImpl<_DeleteItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteItemEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'UserItemEvent.deleteItem(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteItemEventCopyWith<$Res> implements $UserItemEventCopyWith<$Res> {
  factory _$DeleteItemEventCopyWith(_DeleteItemEvent value, $Res Function(_DeleteItemEvent) _then) = __$DeleteItemEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteItemEventCopyWithImpl<$Res>
    implements _$DeleteItemEventCopyWith<$Res> {
  __$DeleteItemEventCopyWithImpl(this._self, this._then);

  final _DeleteItemEvent _self;
  final $Res Function(_DeleteItemEvent) _then;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteItemEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateItemEvent implements UserItemEvent {
  const _UpdateItemEvent(this.item);
  

 final  UserItemEntity item;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateItemEventCopyWith<_UpdateItemEvent> get copyWith => __$UpdateItemEventCopyWithImpl<_UpdateItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateItemEvent&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'UserItemEvent.updateItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$UpdateItemEventCopyWith<$Res> implements $UserItemEventCopyWith<$Res> {
  factory _$UpdateItemEventCopyWith(_UpdateItemEvent value, $Res Function(_UpdateItemEvent) _then) = __$UpdateItemEventCopyWithImpl;
@useResult
$Res call({
 UserItemEntity item
});




}
/// @nodoc
class __$UpdateItemEventCopyWithImpl<$Res>
    implements _$UpdateItemEventCopyWith<$Res> {
  __$UpdateItemEventCopyWithImpl(this._self, this._then);

  final _UpdateItemEvent _self;
  final $Res Function(_UpdateItemEvent) _then;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_UpdateItemEvent(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as UserItemEntity,
  ));
}


}

/// @nodoc


class _SelectItemEvent implements UserItemEvent {
  const _SelectItemEvent(this.item);
  

 final  UserItemEntity item;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectItemEventCopyWith<_SelectItemEvent> get copyWith => __$SelectItemEventCopyWithImpl<_SelectItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectItemEvent&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'UserItemEvent.selectItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$SelectItemEventCopyWith<$Res> implements $UserItemEventCopyWith<$Res> {
  factory _$SelectItemEventCopyWith(_SelectItemEvent value, $Res Function(_SelectItemEvent) _then) = __$SelectItemEventCopyWithImpl;
@useResult
$Res call({
 UserItemEntity item
});




}
/// @nodoc
class __$SelectItemEventCopyWithImpl<$Res>
    implements _$SelectItemEventCopyWith<$Res> {
  __$SelectItemEventCopyWithImpl(this._self, this._then);

  final _SelectItemEvent _self;
  final $Res Function(_SelectItemEvent) _then;

/// Create a copy of UserItemEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_SelectItemEvent(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as UserItemEntity,
  ));
}


}

/// @nodoc
mixin _$UserItemState {

 ViewState get viewState; ItemAction get action; List<UserItemEntity> get items; String? get errorMessage; UserItemEntity? get selectedItem; int get currentPage; bool get hasMoreData; bool get isLoadingMore;
/// Create a copy of UserItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserItemStateCopyWith<UserItemState> get copyWith => _$UserItemStateCopyWithImpl<UserItemState>(this as UserItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserItemState&&(identical(other.viewState, viewState) || other.viewState == viewState)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMoreData, hasMoreData) || other.hasMoreData == hasMoreData)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,viewState,action,const DeepCollectionEquality().hash(items),errorMessage,selectedItem,currentPage,hasMoreData,isLoadingMore);

@override
String toString() {
  return 'UserItemState(viewState: $viewState, action: $action, items: $items, errorMessage: $errorMessage, selectedItem: $selectedItem, currentPage: $currentPage, hasMoreData: $hasMoreData, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $UserItemStateCopyWith<$Res>  {
  factory $UserItemStateCopyWith(UserItemState value, $Res Function(UserItemState) _then) = _$UserItemStateCopyWithImpl;
@useResult
$Res call({
 ViewState viewState, ItemAction action, List<UserItemEntity> items, String? errorMessage, UserItemEntity? selectedItem, int currentPage, bool hasMoreData, bool isLoadingMore
});




}
/// @nodoc
class _$UserItemStateCopyWithImpl<$Res>
    implements $UserItemStateCopyWith<$Res> {
  _$UserItemStateCopyWithImpl(this._self, this._then);

  final UserItemState _self;
  final $Res Function(UserItemState) _then;

/// Create a copy of UserItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewState = null,Object? action = null,Object? items = null,Object? errorMessage = freezed,Object? selectedItem = freezed,Object? currentPage = null,Object? hasMoreData = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
viewState: null == viewState ? _self.viewState : viewState // ignore: cast_nullable_to_non_nullable
as ViewState,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ItemAction,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<UserItemEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedItem: freezed == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as UserItemEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMoreData: null == hasMoreData ? _self.hasMoreData : hasMoreData // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserItemState].
extension UserItemStatePatterns on UserItemState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserItemState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserItemState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserItemState value)  $default,){
final _that = this;
switch (_that) {
case _UserItemState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserItemState value)?  $default,){
final _that = this;
switch (_that) {
case _UserItemState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewState viewState,  ItemAction action,  List<UserItemEntity> items,  String? errorMessage,  UserItemEntity? selectedItem,  int currentPage,  bool hasMoreData,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserItemState() when $default != null:
return $default(_that.viewState,_that.action,_that.items,_that.errorMessage,_that.selectedItem,_that.currentPage,_that.hasMoreData,_that.isLoadingMore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewState viewState,  ItemAction action,  List<UserItemEntity> items,  String? errorMessage,  UserItemEntity? selectedItem,  int currentPage,  bool hasMoreData,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _UserItemState():
return $default(_that.viewState,_that.action,_that.items,_that.errorMessage,_that.selectedItem,_that.currentPage,_that.hasMoreData,_that.isLoadingMore);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewState viewState,  ItemAction action,  List<UserItemEntity> items,  String? errorMessage,  UserItemEntity? selectedItem,  int currentPage,  bool hasMoreData,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _UserItemState() when $default != null:
return $default(_that.viewState,_that.action,_that.items,_that.errorMessage,_that.selectedItem,_that.currentPage,_that.hasMoreData,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _UserItemState implements UserItemState {
   _UserItemState({this.viewState = ViewState.idle, this.action = ItemAction.none, final  List<UserItemEntity> items = const [], this.errorMessage, this.selectedItem, this.currentPage = 1, this.hasMoreData = true, this.isLoadingMore = false}): _items = items;
  

@override@JsonKey() final  ViewState viewState;
@override@JsonKey() final  ItemAction action;
 final  List<UserItemEntity> _items;
@override@JsonKey() List<UserItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? errorMessage;
@override final  UserItemEntity? selectedItem;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMoreData;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of UserItemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserItemStateCopyWith<_UserItemState> get copyWith => __$UserItemStateCopyWithImpl<_UserItemState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserItemState&&(identical(other.viewState, viewState) || other.viewState == viewState)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMoreData, hasMoreData) || other.hasMoreData == hasMoreData)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,viewState,action,const DeepCollectionEquality().hash(_items),errorMessage,selectedItem,currentPage,hasMoreData,isLoadingMore);

@override
String toString() {
  return 'UserItemState(viewState: $viewState, action: $action, items: $items, errorMessage: $errorMessage, selectedItem: $selectedItem, currentPage: $currentPage, hasMoreData: $hasMoreData, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$UserItemStateCopyWith<$Res> implements $UserItemStateCopyWith<$Res> {
  factory _$UserItemStateCopyWith(_UserItemState value, $Res Function(_UserItemState) _then) = __$UserItemStateCopyWithImpl;
@override @useResult
$Res call({
 ViewState viewState, ItemAction action, List<UserItemEntity> items, String? errorMessage, UserItemEntity? selectedItem, int currentPage, bool hasMoreData, bool isLoadingMore
});




}
/// @nodoc
class __$UserItemStateCopyWithImpl<$Res>
    implements _$UserItemStateCopyWith<$Res> {
  __$UserItemStateCopyWithImpl(this._self, this._then);

  final _UserItemState _self;
  final $Res Function(_UserItemState) _then;

/// Create a copy of UserItemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewState = null,Object? action = null,Object? items = null,Object? errorMessage = freezed,Object? selectedItem = freezed,Object? currentPage = null,Object? hasMoreData = null,Object? isLoadingMore = null,}) {
  return _then(_UserItemState(
viewState: null == viewState ? _self.viewState : viewState // ignore: cast_nullable_to_non_nullable
as ViewState,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ItemAction,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<UserItemEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedItem: freezed == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as UserItemEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMoreData: null == hasMoreData ? _self.hasMoreData : hasMoreData // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
