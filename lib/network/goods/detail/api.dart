import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seckill_deal/common/constants/constants.dart';
import 'package:seckill_deal/network/config.dart';
import 'package:seckill_deal/network/goods/detail/model/goods_detail.dart';
import 'package:seckill_deal/network/result.dart';

part 'api.g.dart';

@RestApi()
abstract class GoodsDetailApi {
  factory GoodsDetailApi(Dio dio) =>
      _GoodsDetailApi(dio, baseUrl: Env[baseUrl]);

  @GET('/mission/seckill/getPath')
  Future<Result<String>> getPath(@Query("goodsId") int goodsId);

  @GET('/mission/seckill')
  Future<Result> seckill(
      @Query("goodsId") int goodsId, @Query("path") String path);

  @GET('/mission/seckill/result')
  Future<Result<int>> result(@Query("goodsId") int goodsId);

  @GET('/mission/goods/getDetail/{goodsId}')
  Future<Result<GoodsDetail>> getDetail(@Path('goodsId') int goodsId);
}
