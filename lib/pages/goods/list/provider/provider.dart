import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/log/logger.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';
import 'package:seckill_deal/pages/goods/list/repository/repository.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsListProvider extends ChangeNotifier {
  List<GoodsVo> _goodsVos = [];
  final List<GoodsVo> _inProgressGoodsVos = [];
  final List<GoodsVo> _aboutToStartGoodsVos = [];
  final List<GoodsVo> _distantFutureGoodsVos = [];
  final List<GoodsVo> _endedGoodsVos = [];
  final GoodsListRepository _repository;

  GoodsListProvider({GoodsListRepository? repository})
      : _repository = repository ?? GoodsListRepository();

  Future<void> fetchData() async {
    final response = await _repository.goodsList();
    if (response.code == 200) {
      _goodsVos = response.data ?? [];
      _filterGoodsVos();
      notifyListeners();
    } else {
      logger.e(response.data);
    }
  }

  void _filterGoodsVos() {
    for (var goodsVo in _goodsVos) {
      DateTime startTime = DateTime.parse(goodsVo.goods?.startTime ?? '');
      DateTime endTime = DateTime.parse(goodsVo.goods?.endTime ?? '');
      DateTime now = DateTime.now();
      Duration timeUntilStart = startTime.difference(now);
      Duration timeUntilEnd = endTime.difference(now);

      if (timeUntilStart.isNegative && timeUntilEnd.isNegative) {
        _endedGoodsVos.add(goodsVo);
      } else if (timeUntilStart.isNegative && !timeUntilEnd.isNegative) {
        _inProgressGoodsVos.add(goodsVo);
      } else if (!timeUntilStart.isNegative && timeUntilStart.inHours < 24) {
        _aboutToStartGoodsVos.add(goodsVo);
      } else if (!timeUntilStart.isNegative && timeUntilStart.inHours >= 24) {
        _distantFutureGoodsVos.add(goodsVo);
      }
    }
  }

  List<GoodsVo> getGoodsVosList(String? tabText) {
    if (tabText == stringRes(R.hasEnded)) {
      return _endedGoodsVos;
    } else if (tabText == stringRes(R.inProgress)) {
      return _inProgressGoodsVos;
    } else if (tabText == stringRes(R.aboutToStart)) {
      return _aboutToStartGoodsVos;
    } else if (tabText == stringRes(R.distantFuture)) {
      return _distantFutureGoodsVos;
    }
    return [];
  }
}
