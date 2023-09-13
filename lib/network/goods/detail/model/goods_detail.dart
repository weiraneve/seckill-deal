import 'package:json_annotation/json_annotation.dart';
import 'package:seckill_deal/network/goods/list/model/goods.dart';

part 'goods_detail.g.dart';

@JsonSerializable()
class GoodsDetail {
  final int? remainSeconds;
  final int? stockCount;
  final Goods? goods;

  GoodsDetail(this.remainSeconds, this.stockCount, this.goods);

  factory GoodsDetail.fromJson(Map<String, dynamic> json) => _$GoodsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsDetailToJson(this);
}
