import 'package:chella/features/Authentication/login/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final Dio _dio;

  AuthRepository(http.Client client)
    : _dio = Dio(
        BaseOptions(
          baseUrl: '',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

  Future<UserModel> login(String username, String Password) async {
    try {
      final resonse = await _dio.get('/login');

      return UserModel.fromJson(resonse.data);
    } catch (e) {
      throw Exception('Rakkoon wayii muudateera innis : $e');
    }
  }
}
