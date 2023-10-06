import 'package:flutter/foundation.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/network/login/model/update_password_request.dart';
import 'package:seckill_deal/network/result.dart';
import 'package:seckill_deal/pages/login/repository/update_password_repository.dart';

import '../../../common/logger.dart';

class UpdatePasswordProvider with ChangeNotifier {
  final UpdatePasswordRepository _repository;
  AuthState _state = const AuthInitial();

  UpdatePasswordProvider({UpdatePasswordRepository? repository})
      : _repository = repository ?? UpdatePasswordRepository();

  AuthState get state => _state;
  String _oldPassword = '';
  String _newPassword = '';
  String _confirmNewPassword = '';
  bool isSuccess = false;

  String get oldPassword => _oldPassword;

  String get newPassword => _newPassword;

  String get confirmNewPassword => _confirmNewPassword;

  set oldPassword(String value) {
    _oldPassword = value;
    notifyListeners();
  }

  set newPassword(String value) {
    _newPassword = value;
    notifyListeners();
  }

  set confirmNewPassword(String value) {
    _confirmNewPassword = value;
    notifyListeners();
  }

  Future<void> updatePassword() async {
    if (_newPassword != confirmNewPassword) {
      isSuccess = false;
      notifyListeners();
      return;
    }
    try {
      Result result = await _repository
          .updatePassword(UpdatePasswordRequest(_oldPassword, _newPassword));
      if (result.code == 200) {
        isSuccess = true;
        notifyListeners();
      } else {
        isSuccess = false;
        notifyListeners();
      }
    } catch (e) {
      logger.e(e);
    }
  }

  void _updateState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
