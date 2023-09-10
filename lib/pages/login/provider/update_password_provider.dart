import 'package:flutter/foundation.dart';
import 'package:seckill_deal/network/login/model/update_password_request.dart';
import 'package:seckill_deal/pages/login/repository/update_password_repository.dart';

class UpdatePasswordProvider with ChangeNotifier {
  final UpdatePasswordRepository _repository;

  UpdatePasswordProvider({UpdatePasswordRepository? repository})
      : _repository = repository ?? UpdatePasswordRepository();

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
      await _repository
          .updatePassword(UpdatePasswordRequest(_oldPassword, _newPassword));
    } catch (e) {
      return;
    }
    isSuccess = true;
    notifyListeners();
  }
}
