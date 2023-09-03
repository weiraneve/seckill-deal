import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/network/login/model/login_request.dart';
import 'package:seckill_deal/network/login/model/login_response.dart';
import 'package:seckill_deal/pages/login/repository/repository.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository _repository;
  LoginResponse? _response;
  AuthState _state = const AuthInitial();

  LoginProvider({LoginRepository? repository})
      : _repository = repository ?? LoginRepository();

  LoginResponse? get response => _response;

  AuthState get state => _state;

  Future<void> login(String mobile, String password) async {
    try {
      final loginRequest = LoginRequest(mobile, password);
      _state = AuthLoading();
      notifyListeners();
      _response = await _repository.login(loginRequest);
      _state = AuthSuccess();
      notifyListeners();
    } catch (e) {
      logger.e(e);
      _state = const AuthFailure('errorMsg');
      _response = const LoginResponse(405, 'errorData', 'errorMsg');
    } finally {
      notifyListeners();
    }
  }
}
