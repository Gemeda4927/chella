
import 'package:chella/features/Authentication/register/data/model/register_model.dart';

abstract class AuthRepository {
  Future<RegisterResponse> register(RegisterRequest request);
  // Add other methods like login(), logout(), etc. here later
}