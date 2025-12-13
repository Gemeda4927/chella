import '../services/auth_service.dart';
import '../../domain/enitity/user_entity.dart';
import '../../domain/repository/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _service;

  AuthRepositoryImpl(this._service);

  @override
  Future<UserEntity> login(String username, String password) async {
    final userModel = await _service.login(username, password);
    return UserEntity(
      id: userModel.id,
      username: userModel.username,
      password: userModel.password,
      role: userModel.role,
    );
  }
}
