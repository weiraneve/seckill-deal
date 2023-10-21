import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/token_storage.dart';
import 'package:seckill_deal/common/view_model/base_view_model.dart';
import 'package:seckill_deal/network/login/model/request.dart';
import 'package:seckill_deal/pages/login/repository/login_repository.dart';

class LoginViewModel extends BaseViewModel {
  final LoginRepository _repository;

  LoginViewModel({LoginRepository? repository})
      : _repository = repository ?? LoginRepository();

  Future<void> login(String mobile, String password) async {
    super.updateState(AuthLoading());
    final response = await _repository.login(LoginRequest(mobile, password));
    if (response.code == 200) {
      await tokenStorage.set(response.data ?? '');
      await auth.loadAuthToken();
      super.updateState(AuthSuccess(response.msg));
    } else {
      super.updateState(AuthFailure(error: response.msg));
    }
  }
}
