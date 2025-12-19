import 'package:chella/features/Authentication/register/data/model/register_model.dart';
import 'package:chella/features/Authentication/register/doamin/usecases/register_usecase.dart';
import 'package:flutter/widgets.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase _registerUseCase;

  RegisterModel? _currentUser;
  bool _loading = false;
  String? _error;
  bool _isSuccess = false;
  bool _isRegistered = false;

  RegisterProvider(this._registerUseCase);

  // Getters
  bool get loading => _loading;
  RegisterModel? get user => _currentUser;
  String? get error => _error;
  bool get isSuccess => _isSuccess;
  bool get isRegistered => _isRegistered;

  // Actions
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
      _currentUser = await _registerUseCase.execute(
        fullName: fullName,
        username: username,
        password: password,
      );
      _isSuccess = true;
      _isRegistered = true;
    } catch (e) {
      _error = e.toString();
      _isSuccess = false;
      _isRegistered = false;
    }

    _loading = false;
    notifyListeners();
  }

  void reset() {
    _currentUser = null;
    _loading = false;
    _error = null;
    _isSuccess = false;
    _isRegistered = false; // reset
    notifyListeners();
  }
}
