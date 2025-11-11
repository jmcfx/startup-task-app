// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:startup_task_app/features/items/presentation/pages/add_item_screen.dart'
    as _i1;
import 'package:startup_task_app/features/items/presentation/pages/edit_item_screen.dart'
    as _i2;
import 'package:startup_task_app/features/items/presentation/pages/home_screen.dart'
    as _i3;

/// generated route for
/// [_i1.AddItemScreen]
class AddItemRoute extends _i4.PageRouteInfo<void> {
  const AddItemRoute({List<_i4.PageRouteInfo>? children})
    : super(AddItemRoute.name, initialChildren: children);

  static const String name = 'AddItemRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddItemScreen();
    },
  );
}

/// generated route for
/// [_i2.EditItemScreen]
class EditItemRoute extends _i4.PageRouteInfo<EditItemRouteArgs> {
  EditItemRoute({
    _i5.Key? key,
    required String id,
    required String title,
    required String description,
    required String name,
    String? avatar,
    String? createdAt,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         EditItemRoute.name,
         args: EditItemRouteArgs(
           key: key,
           id: id,
           title: title,
           description: description,
           name: name,
           avatar: avatar,
           createdAt: createdAt,
         ),
         initialChildren: children,
       );

  static const String name = 'EditItemRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditItemRouteArgs>();
      return _i2.EditItemScreen(
        key: args.key,
        id: args.id,
        title: args.title,
        description: args.description,
        name: args.name,
        avatar: args.avatar,
        createdAt: args.createdAt,
      );
    },
  );
}

class EditItemRouteArgs {
  const EditItemRouteArgs({
    this.key,
    required this.id,
    required this.title,
    required this.description,
    required this.name,
    this.avatar,
    this.createdAt,
  });

  final _i5.Key? key;

  final String id;

  final String title;

  final String description;

  final String name;

  final String? avatar;

  final String? createdAt;

  @override
  String toString() {
    return 'EditItemRouteArgs{key: $key, id: $id, title: $title, description: $description, name: $name, avatar: $avatar, createdAt: $createdAt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditItemRouteArgs) return false;
    return key == other.key &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        name == other.name &&
        avatar == other.avatar &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      name.hashCode ^
      avatar.hashCode ^
      createdAt.hashCode;
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}
