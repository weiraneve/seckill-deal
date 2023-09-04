import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seckill_deal/common/constants.dart';
import 'package:seckill_deal/network/register/model/request.dart';
import 'package:seckill_deal/network/register/model/response.dart';

import '../config.dart';

part 'api.g.dart';

@RestApi()
abstract class RegisterApi {
  factory RegisterApi(Dio dio) => _RegisterApi(dio, baseUrl: Env[baseUrl]);

  @POST('/uaa/user/doRegister')
  Future<RegisterResponse> register(@Body() RegisterRequest request);
}
