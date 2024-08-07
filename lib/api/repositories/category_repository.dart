import 'dart:convert';

import 'package:vantini_shop/api/http_client.dart';
import 'package:vantini_shop/src/models/category_model.dart';

abstract class ICategoryRepository {
  Future<List<CategoryModel>> index(String token);
}

class CategoryRepository implements ICategoryRepository {
  @override
  Future<List<CategoryModel>> index(String token) async {
    try {
      final response = await MyHttpClient.get(
        url: '/categories?has_pagination=false',
        headers: MyHttpClient.getHeaders(token: token),
      );
      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        final body = jsonDecode(response.body);
        body.map((category) {
          categories.add(CategoryModel.fromMap(category as Map<String, dynamic>));
        }).toList();
        return categories;
      } else {
        throw 'Failed to fetch categories';
      }
    } catch (e) {
      rethrow;
    }
  }
}
