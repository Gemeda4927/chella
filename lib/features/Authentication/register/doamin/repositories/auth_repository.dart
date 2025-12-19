import 'package:chella/features/Authentication/register/data/model/register_model.dart';

abstract class RegisterRepository {
  Future<RegisterModel> register({
    required String fullName,
    required String username,
    required String password,
  });
}
