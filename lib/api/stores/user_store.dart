import 'package:flutter/material.dart';
import 'package:vantini_shop/api/exceptions.dart';
import 'package:vantini_shop/api/repositories/user_repository.dart';
import 'package:vantini_shop/src/models/user_model.dart';

class UserStore {
  final IUserRepository repository;
  UserStore({required this.repository});

  ValueNotifier<UserModel?> state = ValueNotifier<UserModel?>(null);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> erro = ValueNotifier<String>('');

  Future showUser(String token) async {
    isLoading.value = true;
    try {
      final result = await repository.show(token);
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
