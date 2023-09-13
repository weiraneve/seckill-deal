import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/goods/detail/api.dart';
import 'package:seckill_deal/network/goods/detail/model/goods_detail.dart';
import 'package:seckill_deal/network/result.dart';

class GoodsDetailRepository {
  final GoodsDetailApi _api;

  GoodsDetailRepository({GoodsDetailApi? goodsDetailApi})
      : _api = goodsDetailApi ??
            Get.put(GoodsDetailApi(Get.find<DioClient>().dio));

  Future<Result<GoodsDetail>> getDetail(int goodsId) async {
    return await _api.getDetail(goodsId);
  }

  Future<bool> seckill(int goodsId) async {
    Result<String> pathResult = await _api.getPath(goodsId);
    Result<int> seckillResult = await _api.seckill(goodsId, pathResult.data);
    if (seckillResult.data != 0) {
      return false;
    }
    return _poll(goodsId);
  }

  Future<bool> _poll(int goodsId) async {
    Result<int> result = await _api.result(goodsId);
    if (result.data == 0) {
      return _poll(goodsId);
    } else if (result.data > 0) {
      return true;
    } else if (result.data < 0) {
      return false;
    }
    return false;
  }
}
