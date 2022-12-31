import 'package:dio/dio.dart';
import 'package:recipes_app/src/data/api_client.dart';

class RecipesDatasource {
  final ApiClient _client;

  RecipesDatasource(this._client);

  Future<Response> getRecipesForCategory(String categoryId) =>
      _client.dio.get('${Endpoint.filter}c=$categoryId');

  Future<Response> getRecipe(String id) =>
      _client.dio.get('${Endpoint.lookup}i=$id');

  Future<Response> getCategories() => _client.dio.get('${Endpoint.list}c=list');

  Future<Response> getRandomRecipe() => _client.dio.get(Endpoint.random);
}
