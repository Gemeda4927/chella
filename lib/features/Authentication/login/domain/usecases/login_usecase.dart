import 'package:chella/features/Authentication/login/domain/repository/repository.dart'
    show AuthRepository;

import '../enitity/user_entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call(String username, String password) {
    return repository.login(username, password);
  }
}
