import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/goods/detail/api.dart';
import 'package:seckill_deal/network/goods/detail/model/goods_detail.dart';
import 'package:seckill_deal/network/result.dart';

class GoodsDetailRepository {
  final GoodsDetailApi _api;

  GoodsDetailRepository({GoodsDetailApi? goodsDetailApi})
      : _api = goodsDetailApi ??
            Get.put(GoodsDetailApi(Get.find<DioClient>().dio));

  static const String success = '1';
  static const String failure = '0';
  static const int _maxRetries = 10;

  Future<Result<GoodsDetail>> getDetail(int goodsId) async {
    return await _api.getDetail(goodsId);
  }

  Future<String> seckill(int goodsId) async {
    try {
      Result<String> pathResult = await _api.getPath(goodsId);
      Result seckillResult = await _api.seckill(goodsId, pathResult.data);
      if (seckillResult.data != 0) {
        return seckillResult.msg;
      }
      return await _poll(goodsId);
    } catch (e) {
      logger.e(e);
      return failure;
    }
  }

  Future<String> _poll(int goodsId) async {
    int retries = 0;

    while (retries < _maxRetries) {
      try {
        Result<int> result = await _api.result(goodsId);
        if (result.data == 0) {
          retries++;
          continue;
        } else if (result.data > 0) {
          return success;
        } else if (result.data < 0) {
          return failure;
        }
      } catch (e) {
        retries++;
        logger.e(e);
      }
    }
    return failure;
  }
}
