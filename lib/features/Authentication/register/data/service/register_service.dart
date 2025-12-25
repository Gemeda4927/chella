import 'package:chella/features/Authentication/register/data/model/register_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/api_exceptions.dart';
import '../../../../../core/network/api_endpoints.dart';

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
        Endpoints.register,
        data: {
          'fullName': fullName,
          'username': username,
          'password': password,
        },
      );

      final user = RegisterModel.fromJson(response.data);

      return user.copyWith(isRegistered: true);
    } on DioError catch (e) {
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
