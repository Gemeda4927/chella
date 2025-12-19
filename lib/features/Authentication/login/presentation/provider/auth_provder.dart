import 'package:flutter/widgets.dart';
import '../../domain/enitity/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase _loginUseCase;

  UserEntity? _currentUser;
  bool _loading = false;
  String? _error;

  AuthProvider(this._loginUseCase);

  bool get loading => _loading;
  UserEntity? get user => _currentUser;
  String? get error => _error;

  Future<void> login(String username, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final user = await _loginUseCase(username, password);
      _currentUser = user;
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }

  
}
