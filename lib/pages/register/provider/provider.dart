import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/network_util.dart';
import 'package:seckill_deal/network/register/model/request.dart';
import 'package:seckill_deal/pages/register/repository/repository.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepository _repository;
  AuthState _state = const AuthInitial();

  RegisterProvider({RegisterRepository? repository})
      : _repository = repository ?? RegisterRepository();

  AuthState get state => _state;

  Future<void> register(String mobile, String password) async {
    try {
      _updateState(AuthLoading());
      final response =
          await _repository.register(RegisterRequest(mobile, password));
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
