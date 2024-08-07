import 'package:flutter/material.dart';
import 'package:vantini_shop/api/exceptions.dart';
import 'package:vantini_shop/api/repositories/auth_repository.dart';

class AuthStore {
  final IAuthRepository repository;
  AuthStore({required this.repository});

  ValueNotifier<String> stateToLogin = ValueNotifier<String>('');
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> erro = ValueNotifier<String>('');

  Future login(Map<String, String> body) async {
    isLoading.value = true;
    try {
      final result = await repository.login(body);
      if (result is String) {
        stateToLogin.value = result;
      }
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
