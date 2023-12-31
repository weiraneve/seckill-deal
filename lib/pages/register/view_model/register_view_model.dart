import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/view_model/base_view_model.dart';
import 'package:seckill_deal/network/register/model/request.dart';
import 'package:seckill_deal/pages/register/repository/repository.dart';

class RegisterViewModel extends BaseViewModel {
  final RegisterRepository _repository;

  RegisterViewModel({RegisterRepository? repository})
      : _repository = repository ?? RegisterRepository();

  Future<void> register(String mobile, String password) async {
    state = AuthLoading();
    final response =
        await _repository.register(RegisterRequest(mobile, password));
    if (response.code == 200) {
      state = AuthSuccess(response.msg);
    } else {
      state = AuthFailure(error: response.msg);
    }
  }
}
