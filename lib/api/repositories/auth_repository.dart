import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vantini_shop/api/http_client.dart';

abstract class IAuthRepository {
  Future<dynamic> login(Map<String, String> body);
}

class AuthRepository implements IAuthRepository {
  @override
  Future<dynamic> login(Map<String, String> body) async {
    try {
      final response = await MyHttpClient.post(
        url: '/login',
        headers: MyHttpClient.getHeaders(),
        body: body,
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        SharedPreferences cache = await SharedPreferences.getInstance();
        cache.setString('token', body['token']);

        return body['token'];
      } else {
        switch (response.statusCode) {
          case 422:
            throw 'Credenciais inválidas.';
          default:
            throw 'Falha ao fazer login, tente novamente mais tarde.';
        }
      }
    } on Exception catch (e) {
      throw Exception('login falhou: $e');
    }
  }
}
