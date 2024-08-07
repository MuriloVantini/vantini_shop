import 'package:vantini_shop/api/http_client.dart';
import 'package:vantini_shop/src/models/user_model.dart';

abstract class IUserRepository {
  Future<dynamic> show(String token);
}

class UserRepository implements IUserRepository {
  @override
  Future<dynamic> show(String token) async {
    try {
      final response = await MyHttpClient.get(
        url: '/user',
        headers: MyHttpClient.getHeaders(),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      } else {
        throw 'Failed to fetch user';
      }
    } catch (e) {
      rethrow;
    }
  }
}
