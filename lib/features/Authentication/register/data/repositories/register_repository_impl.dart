import 'package:chella/features/Authentication/register/data/model/register_model.dart';
import 'package:chella/features/Authentication/register/data/service/register_service.dart';
import 'package:chella/features/Authentication/register/doamin/repositories/auth_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterService _registerService;

  RegisterRepositoryImpl(this._registerService);

  @override
  Future<RegisterModel> register({
    required String fullName,
    required String username,
    required String password,
  }) async {
    try {
      final userModel = await _registerService.register(
        fullName: fullName,
        username: username,
        password: password,
      );
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
