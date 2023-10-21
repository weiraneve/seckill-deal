import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/view_model/base_view_model.dart';
import 'package:seckill_deal/network/goods/detail/model/goods_detail.dart';
import 'package:seckill_deal/network/goods/list/model/goods.dart';
import 'package:seckill_deal/network/result.dart';
import 'package:seckill_deal/pages/goods/detail/repository/repository.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsDetailViewModel extends BaseViewModel {
  int? stockCount;
  Goods? goods;
  final int goodsId;
  final GoodsDetailRepository _repository;

  GoodsDetailViewModel(this.goodsId, {GoodsDetailRepository? repository})
      : _repository = repository ?? GoodsDetailRepository();

  Future<void> getDetail() async {
    Result<GoodsDetail> goodsDetail = await _repository.getDetail(goodsId);
    stockCount = goodsDetail.data.stockCount;
    goods = goodsDetail.data.goods;
    notifyListeners();
  }

  Future<void> seckill() async {
    super.updateState(AuthLoading());
    String seckillResult = await _repository.seckill(goodsId);
    if (seckillResult == GoodsDetailRepository.success) {
      super.updateState(AuthSuccess(stringRes(R.successful)));
      refreshGoodsDetail();
    } else {
      super.updateState(AuthFailure(error: seckillResult));
    }
  }

  void refreshGoodsDetail() {
    getDetail();
    notifyListeners();
  }
}
