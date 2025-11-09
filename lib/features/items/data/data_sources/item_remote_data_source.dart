import 'package:startup_task_app/features/items/data/client/user_item_client.dart';
import 'package:startup_task_app/features/items/data/models/item_model.dart';

/// Contract for data operations (remote)
abstract interface class ItemRemoteDataSource {
  Future<List<ItemModel>> getItems();
  Future<ItemModel> addItem(ItemModel item);
  Future<ItemModel> updateItem(ItemModel item);
  Future<void> deleteItem(String id); // void is fine
}

/// Implementation that communicates with the REST API via Retrofit client
class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final UserItemClient _client;

  ItemRemoteDataSourceImpl({required UserItemClient client}) : _client = client;

  @override
  Future<ItemModel> addItem(ItemModel item) async {
    return await _client.addItem(item);
  }

  @override
  Future<void> deleteItem(String id) async {
    await _client.deleteItem(id);
  }

  @override
  Future<List<ItemModel>> getItems() async {
    return await _client.getItems();
  }

  @override
  Future<ItemModel> updateItem(ItemModel item) async {
    return await _client.updateItem(item.id!, item);
  }
}
