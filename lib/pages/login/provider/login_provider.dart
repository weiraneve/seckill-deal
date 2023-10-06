import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/token_storage.dart';
import 'package:seckill_deal/network/login/model/request.dart';
import 'package:seckill_deal/pages/login/repository/login_repository.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository _repository;
  AuthState _state = const AuthInitial();

  LoginProvider({LoginRepository? repository})
      : _repository = repository ?? LoginRepository();

  AuthState get state => _state;

  Future<void> login(String mobile, String password) async {
    _updateState(AuthLoading());
    final response = await _repository.login(LoginRequest(mobile, password));
    if (response.code == 200) {
      await tokenStorage.set(response.data ?? '');
      await auth.loadAuthToken();
      _updateState(AuthSuccess(response.msg));
    } else {
      _updateState(AuthFailure(error: response.msg));
    }
  }

  void _updateState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
