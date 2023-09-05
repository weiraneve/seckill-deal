import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seckill_deal/common/constants.dart';
import 'package:seckill_deal/network/config.dart';
import 'package:seckill_deal/network/goods/list/model/goods_response.dart';

part 'api.g.dart';

@RestApi()
abstract class GoodsListApi {
  factory GoodsListApi(Dio dio) => _GoodsListApi(dio, baseUrl: Env[baseUrl]);

  @GET('/mission/goods/getGoodsList')
  Future<GoodsResponse> goodsList();
}
