import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/network/goods/detail/model/goods_detail.dart';
import 'package:seckill_deal/network/result.dart';
import 'package:seckill_deal/network/goods/list/model/goods.dart';
import 'package:seckill_deal/pages/goods/detail/repository/repository.dart';

class GoodsDetailProvider extends ChangeNotifier {
  int? stockCount;
  Goods? goods;
  final int goodsId;
  final GoodsDetailRepository _repository;

  GoodsDetailProvider(this.goodsId, {GoodsDetailRepository? repository})
      : _repository = repository ?? GoodsDetailRepository() {
    _getDetail(goodsId);
  }

  Future<void> _getDetail(int goodsId) async {
    Result<GoodsDetail> goodsDetail = await _repository.getDetail(goodsId);
    stockCount = goodsDetail.data.stockCount;
    goods = goodsDetail.data.goods;
    notifyListeners();
  }

  Future<bool> seckill(int goodsId) async {
    return _repository.seckill(goodsId);
  }
}
