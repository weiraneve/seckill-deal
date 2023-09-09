import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';

class GoodsDetailProvider extends ChangeNotifier {
  final GoodsVo goodsVo;

  GoodsDetailProvider(this.goodsVo);
}
