import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';

class BaseViewModel extends ChangeNotifier {
  AuthState _state = const AuthInitial();
  bool _disposed = false;

  AuthState get state => _state;

  set state(AuthState state) {
    _state = state;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
