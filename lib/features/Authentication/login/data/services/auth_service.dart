import 'package:chella/core/network/api_endpoints.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/api_exceptions.dart';
import '../model/user_model.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<RegisterModel> login(String username, String password) async {
    try {
      final response = await _dioClient.post(
        Endpoints.login,
        data: {'username': username, 'password': password},
      );

      final user = RegisterModel.fromJson(response.data);

      return user;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final message = e.response?.data['message'] ?? e.message;

      switch (statusCode) {
        case 400:
          throw BadRequestException(message);
        case 401:
          throw UnauthorizedException(message);
        case 403:
          throw ForbiddenException(message);
        case 404:
          throw NotFoundException(message);
        case 500:
          throw ServerException(message);
        default:
          throw ApiException(message, statusCode: statusCode);
      }
    }
  }
}
