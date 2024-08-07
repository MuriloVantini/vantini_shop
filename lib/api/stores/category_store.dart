import 'package:flutter/material.dart';
import 'package:vantini_shop/api/exceptions.dart';
import 'package:vantini_shop/api/repositories/category_repository.dart';
import 'package:vantini_shop/src/models/category_model.dart';

class CategoryStore {
  final ICategoryRepository repository;

  CategoryStore({required this.repository});

  ValueNotifier<List<CategoryModel>> state = ValueNotifier<List<CategoryModel>>([]);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> erro = ValueNotifier<String>('');

  Future index(String token) async {
    isLoading.value = true;
    try {
      final response = await repository.index(token);
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
