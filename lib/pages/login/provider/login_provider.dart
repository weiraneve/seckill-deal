import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/network_util.dart';
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
    try {
      _updateState(AuthLoading());
      final response = await _repository.login(LoginRequest(mobile, password));
      await tokenStorage.set(response.data ?? '');
      await auth.loadAuthToken();
      _updateState(AuthSuccess(response.msg));
    } catch (e) {
      _updateState(AuthFailure(error: NetworkUtil.handleErrorMessage(e)));
    }
  }

  void _updateState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
