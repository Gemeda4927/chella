import 'package:dio/dio.dart';

import '../../../../../core/handlers/dio_client.dart';
import '../model/user_model.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<UserModel> login(String username, String password) async {
    // print('Username is ' , $user)
    try {
      final response = await _dioClient.post(
        'users/login',
        data: {'username': username, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
