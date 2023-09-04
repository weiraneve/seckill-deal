import 'package:get/get.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/register/api.dart';
import 'package:seckill_deal/network/register/model/request.dart';
import 'package:seckill_deal/network/register/model/response.dart';

class RegisterRepository {
  final RegisterApi _api;

  RegisterRepository({RegisterApi? registerApi})
      : _api = registerApi ?? Get.put(RegisterApi(Get.find<DioClient>().dio));

  Future<RegisterResponse> register(RegisterRequest request) =>
      _api.register(request);
}
