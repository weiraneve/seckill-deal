import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';
import 'package:seckill_deal/pages/goods/detail/repository/repository.dart';

class GoodsDetailProvider extends ChangeNotifier {
  final GoodsVo goodsVo;
  final GoodsDetailRepository _repository;

  GoodsDetailProvider(
      {GoodsDetailRepository? repository, required this.goodsVo})
      : _repository = repository ?? GoodsDetailRepository();

  Future<bool> seckill(int goodsId) async {
    return _repository.seckill(goodsId);
  }
}
