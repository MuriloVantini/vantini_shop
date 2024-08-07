import 'dart:convert';

import 'package:vantini_shop/api/http_client.dart';
import 'package:vantini_shop/src/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> index(bool hasPagination, String token, String? search, int? page);
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> index(bool hasPagination, String token, String? search, int? page) async {
    try {
      final response = await MyHttpClient.get(
        url: '/products?has_pagination=$hasPagination&page=$page&search=$search',
        headers: MyHttpClient.getHeaders(token: token),
      );
      if (response.statusCode == 200) {
        List<ProductModel> products = [];

        final body = jsonDecode(response.body);
        body.map((product) {
          products.add(ProductModel.fromMap(product as Map<String, dynamic>));
        }).toList();
        return products;
      } else {
        throw 'Error fetching products: ${response.statusCode}';
      }
    } catch (e) {
      rethrow;
    }
  }
}
