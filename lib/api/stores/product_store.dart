import 'package:flutter/material.dart';
import 'package:vantini_shop/api/exceptions.dart';
import 'package:vantini_shop/api/repositories/product_repository.dart';
import 'package:vantini_shop/src/models/product_model.dart';

class ProductStore {
  final IProductRepository repository;

  ProductStore({required this.repository});

  ValueNotifier<List<ProductModel>> state = ValueNotifier<List<ProductModel>>([]);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> erro = ValueNotifier<String>('');

  Future index(bool hasPagination, String token, String? search, int? page) async {
    isLoading.value = true;
    try {
      final response = await repository.index(hasPagination, token, search, page);
      state.value = response;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
