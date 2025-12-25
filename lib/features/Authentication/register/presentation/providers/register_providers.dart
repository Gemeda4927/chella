import 'package:chella/features/Authentication/login/data/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:chella/core/network/token_manager.dart';
import '../../doamin/usecases/register_usecase.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase _registerUseCase;
  final TokenManager _tokenManager = TokenManager();

  RegisterModel? _currentUser;
  bool _loading = false;
  String? _error;
  bool _isSuccess = false;
  bool _isRegistered = false;

  RegisterProvider(this._registerUseCase);

  bool get loading => _loading;
  RegisterModel? get user => _currentUser;
  String? get error => _error;
  bool get isSuccess => _isSuccess;
  bool get isRegistered => _isRegistered;

  Future<void> register({
    required String fullName,
    required String username,
    required String password,
  }) async {
    _loading = true;
    _error = null;
    _isSuccess = false;
    _isRegistered = false;
    notifyListeners();

    try {
      _currentUser =
          (await _registerUseCase.execute(
                fullName: fullName,
                username: username,
                password: password,
              ))
              as RegisterModel?;

      if (_currentUser?.accessToken != null) {
        await _tokenManager.getToken();
      }

      _isSuccess = true;
      _isRegistered = true;
    } catch (e) {
      _error = e.toString();
      _isSuccess = false;
      _isRegistered = false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void reset() {
    _currentUser = null;
    _loading = false;
    _error = null;
    _isSuccess = false;
    _isRegistered = false;
    notifyListeners();
  }
}
