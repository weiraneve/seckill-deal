import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/network/register/model/request.dart';
import 'package:seckill_deal/pages/register/repository/repository.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepository _repository;
  AuthState _state = const AuthInitial();

  RegisterProvider({RegisterRepository? repository})
      : _repository = repository ?? RegisterRepository();

  AuthState get state => _state;

  Future<void> register(String mobile, String password) async {
    _updateState(AuthLoading());
    final response =
        await _repository.register(RegisterRequest(mobile, password));
    if (response.code == 200) {
      _updateState(AuthSuccess(response.msg));
    } else {
      _updateState(AuthFailure(error: response.data));
    }
  }

  void _updateState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
