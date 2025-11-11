import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:startup_task_app/features/items/data/models/item_model.dart';

part 'user_item_client.g.dart';

@RestApi(baseUrl: 'https://690f727345e65ab24ac3dafc.mockapi.io/user')
abstract class UserItemClient {
  factory UserItemClient(Dio dio, {String? baseUrl}) = _UserItemClient;

  @GET('/items')
  Future<List<ItemModel>> getItems({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
  });

  @DELETE('/items/{id}')
  Future<void> deleteItem(@Path('id') String id);

  @POST('/items')
  Future<ItemModel> addItem(@Body() ItemModel item);

  @PUT('/items/{id}')
  Future<ItemModel> updateItem(@Path('id') String id, @Body() ItemModel item);
}
