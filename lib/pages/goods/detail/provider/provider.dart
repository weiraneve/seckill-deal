import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/network_util.dart';
import 'package:seckill_deal/network/goods/detail/model/goods_detail.dart';
import 'package:seckill_deal/network/goods/list/model/goods.dart';
import 'package:seckill_deal/network/result.dart';
import 'package:seckill_deal/pages/goods/detail/repository/repository.dart';

class GoodsDetailProvider extends ChangeNotifier {
  int? stockCount;
  Goods? goods;
  final int goodsId;
  final GoodsDetailRepository _repository;

  AuthState _state = const AuthInitial();

  AuthState get state => _state;

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

  Future<void> seckill(int goodsId) async {
    try {
      _updateState(AuthLoading());
      if (await _repository.seckill(goodsId)) {
        _updateState(AuthSuccess("秒杀成功"));
      }
    } catch (e) {
      _updateState(AuthFailure(error: NetworkUtil.handleErrorMessage(e)));
    }
  }

  void _updateState(AuthState state) {
    _state = state;
    notifyListeners();
  }
}
