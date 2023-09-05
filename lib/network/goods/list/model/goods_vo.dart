import 'package:json_annotation/json_annotation.dart';
import 'package:seckill_deal/network/goods/list/model/goods.dart';

part 'goods_vo.g.dart';

@JsonSerializable()
class GoodsVo {
  final int? remainSeconds;
  final int? stockCount;
  final Goods? goods;

  GoodsVo(this.remainSeconds, this.stockCount, this.goods);

  factory GoodsVo.fromJson(Map<String, dynamic> json) =>
      _$GoodsVoFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsVoToJson(this);
}
