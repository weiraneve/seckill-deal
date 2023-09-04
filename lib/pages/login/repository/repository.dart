import 'package:get/get.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/login/api.dart';
import 'package:seckill_deal/network/login/model/request.dart';
import 'package:seckill_deal/network/login/model/response.dart';

class LoginRepository {
  final LoginApi _api;

  LoginRepository({LoginApi? loginApi})
      : _api = loginApi ?? Get.put(LoginApi(Get.find<DioClient>().dio));

  Future<LoginResponse> login(LoginRequest request) => _api.login(request);
}
