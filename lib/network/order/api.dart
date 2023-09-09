import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seckill_deal/common/constants.dart';
import 'package:seckill_deal/network/order/model/response.dart';

import '../config.dart';

part 'api.g.dart';

@RestApi()
abstract class OrderApi {
  factory OrderApi(Dio dio) => _OrderApi(dio, baseUrl: Env[baseUrl]);

  @POST('/mission/order')
  Future<OrderResponse> order();
}
