import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';

class BaseViewModel extends ChangeNotifier {
  AuthState _state = const AuthInitial();

  AuthState get state => _state;

  void updateState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
