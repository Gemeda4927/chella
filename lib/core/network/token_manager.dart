import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final String _token = 'auth_token';

  Future<void> (String token) async {
    final localstorage = await SharedPreferences.getInstance();
    await localstorage.setString(_token, token);
  }

  Future<String?> getToken() async {
    final localstorage = await SharedPreferences.getInstance();
    return localstorage.getString(_token);
  }

  Future<void> clearTokens() async {
    final localstorage = await SharedPreferences.getInstance();
    await localstorage.remove(_token);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
