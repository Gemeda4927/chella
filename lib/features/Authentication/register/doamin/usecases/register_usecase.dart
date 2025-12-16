import 'package:chella/features/Authentication/register/data/model/register_model.dart';

import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final RegisterRepository _repository;

  RegisterUseCase(this._repository);

  Future<RegisterModel> execute({
    required String fullName,
    required String username,
    required String password,
  }) async {
    return await _repository.register(
      fullName: fullName,
      username: username,
      password: password,
    );
  }
}
