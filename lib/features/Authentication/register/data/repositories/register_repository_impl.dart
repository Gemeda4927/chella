import '../model/register_model.dart';
import '../service/register_service.dart';
import '../../doamin/repositories/auth_repository.dart';

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
      final registerModel = await _registerService.register(
        fullName: fullName,
        username: username,
        password: password,
      );
      return registerModel;
    } catch (e) {
      rethrow;
    }
  }
}
