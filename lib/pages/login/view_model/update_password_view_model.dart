import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/view_model/base_view_model.dart';
import 'package:seckill_deal/network/login/model/update_password_request.dart';
import 'package:seckill_deal/network/result.dart';
import 'package:seckill_deal/pages/login/repository/update_password_repository.dart';
import 'package:seckill_deal/res/strings.dart';

import '../../../common/log/logger.dart';

class UpdatePasswordViewModel extends BaseViewModel {
  final UpdatePasswordRepository _repository;

  UpdatePasswordViewModel({UpdatePasswordRepository? repository})
      : _repository = repository ?? UpdatePasswordRepository();

  String _oldPassword = '';
  String _newPassword = '';
  String _confirmNewPassword = '';

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
      state = AuthFailure(error: stringRes(R.mismatchError));
      return;
    }
    try {
      Result response = await _repository
          .updatePassword(UpdatePasswordRequest(_oldPassword, _newPassword));
      if (response.code == 200) {
        state = AuthSuccess('');
      } else {
        state = AuthFailure(error: response.msg);
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
