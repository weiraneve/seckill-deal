import 'package:get/get.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/login/api.dart';
import 'package:seckill_deal/network/login/model/update_password_request.dart';
import 'package:seckill_deal/network/result.dart';

class UpdatePasswordRepository {
  final LoginApi _api;

  UpdatePasswordRepository({LoginApi? loginApi})
      : _api = loginApi ?? Get.put(LoginApi(Get.find<DioClient>().dio));

  Future<Result> updatePassword(UpdatePasswordRequest request) =>
      _api.updatePassword(request);
}
