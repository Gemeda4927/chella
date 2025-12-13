import 'package:dio/dio.dart';
import '../model/user_model.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<UserModel> login(String username, String password) async {
    try {
      final response = await dio.post(
        'users/login',
        data: {'username': username, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
