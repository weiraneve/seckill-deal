import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seckill_deal/common/constants.dart';
import 'package:seckill_deal/network/login/model/login_response.dart';

import '../config.dart';
import 'model/login_request.dart';

part 'api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) => _LoginApi(dio, baseUrl: Env[baseUrl]);

  @POST('/uaa/user/doLogin')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
