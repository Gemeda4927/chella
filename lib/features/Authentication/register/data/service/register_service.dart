import 'package:chella/features/Authentication/register/data/model/register_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/handlers/dio_client.dart';

class RegisterService {
  final DioClient _dioClient;

  RegisterService(this._dioClient);

  Future<RegisterModel> register({
    required String fullName,
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        'users/register',
        data: {
          'fullName': fullName,
          'username': username,
          'password': password,
        },
      );
      return RegisterModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Registration failed');
    }
  }
}
