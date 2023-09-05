import 'package:get/get.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/goods/list/api.dart';
import 'package:seckill_deal/network/goods/list/model/goods_response.dart';

class GoodsListRepository {
  final GoodsListApi _api;

  GoodsListRepository({GoodsListApi? goodsListApi})
      : _api = goodsListApi ?? Get.put(GoodsListApi(Get.find<DioClient>().dio));

  Future<GoodsResponse> goodsList() => _api.goodsList();
}
