import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seckill_deal/common/constants/constants.dart';
import 'package:seckill_deal/network/login/model/response.dart';
import 'package:seckill_deal/network/login/model/update_password_request.dart';
import 'package:seckill_deal/network/result.dart';

import '../config.dart';
import 'model/request.dart';

part 'api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) => _LoginApi(dio, baseUrl: Env[baseUrl]);

  @POST('/uaa/user/doLogin')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('/uaa/user/updatePass')
  Future<Result> updatePassword(@Body() UpdatePasswordRequest request);
}
