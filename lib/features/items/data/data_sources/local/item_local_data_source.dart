import 'package:hive_flutter/hive_flutter.dart';
import 'package:startup_task_app/core/errors/exceptions.dart';
import 'package:startup_task_app/features/items/data/models/item_model.dart';

abstract interface class ItemLocalDataSource {
  Future<List<ItemModel>> getItems();
  Future<void> cacheItems(List<ItemModel> items);
}

class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  final Box _box;

  ItemLocalDataSourceImpl({required Box box}) : _box = box;

  static const _cacheKey = 'cached_items';

  @override
  Future<List<ItemModel>> getItems() async {
    try {
      final cachedData = _box.get(_cacheKey);
      if (cachedData == null) throw CacheException();

      final items = (cachedData as List).map((e) => ItemModel.fromJson(Map<String, dynamic>.from(e))).toList();
      return items;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheItems(List<ItemModel> items) async {
    try {
      final jsonList = items.map((e) => e.toJson()).toList();
      await _box.put(_cacheKey, jsonList);
    } catch (e) {
      throw CacheException();
    }
  }
}
